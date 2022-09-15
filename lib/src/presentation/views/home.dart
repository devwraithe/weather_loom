import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/presentation/widgets/custom_snack.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../core/utils/api_utils.dart';
import '../../presentation/widgets/attributes_card.dart';
import '../../presentation/widgets/default_response.dart';
import '../../presentation/widgets/search_field.dart';
import '../../presentation/bloc/weather/weather_bloc.dart';
import '../../presentation/bloc/weather/weather_event.dart';
import '../../presentation/bloc/weather/weather_state.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isSearchIcon = false;
  void _toggleSearch() {
    setState(() {
      _isSearchIcon = !_isSearchIcon;
    });
  }

  TextEditingController searchController = TextEditingController();

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initiateConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint('Couldn\'t check connectivity status => $e');
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(
      () {
        _connectionStatus = result;
        _connectionStatus == ConnectivityResult.wifi ||
                _connectionStatus == ConnectivityResult.mobile
            ? CustomSnack.buildSnackBar(
                "Internet is connected",
                Colors.green,
                context,
              )
            : CustomSnack.buildSnackBar(
                "Internet is not connected",
                Colors.red,
                context,
              );
      },
    );
  }

  List? locationData = [];
  String? daysDate;

  Future<String> todaysDate() async {
    var today = DateTime.now();
    var dateFormat = DateFormat("yMMMEd");
    String currentDate = dateFormat.format(today);
    setState(() {
      daysDate = currentDate.toString();
    });
    log(daysDate.toString());
    return daysDate!;
  }

  Future<List?> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final coordinates = Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    log(first.locality.toString());
    setState(() {
      locationData = [
        first.locality.toString(),
        first.countryName.toString(),
      ];
    });
    log(locationData![0].toString());
    context.read<WeatherBloc>().add(
          OnCityChanged(
            locationData![0].toString(),
          ),
        );
    return locationData;
  }

  @override
  void initState() {
    searchController;
    initiateConnectivity();
    getLocation();
    todaysDate();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  final form = FormGroup({
    'searchLocation': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.84,
                    child: const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                } else if (state is WeatherHasData) {
                  return Column(
                    key: const Key('weather_data'),
                    children: [
                      searchField(),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 42),
                        child: Column(
                          children: [
                            Text(
                              "${state.result.cityName}, ${state.result.countryAbbr}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              daysDate!.isEmpty ? "" : daysDate!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                            ),
                            const SizedBox(height: 34),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              width: 110,
                              height: 110,
                              child: Image(
                                image: NetworkImage(
                                  ApiUrls.weatherIcon(
                                    state.result.iconCode,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 34),
                            Text(
                              "${(state.result.temperature - 273.15).roundToDouble().toString()}\u{00B0}c",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                    fontSize: 58,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "${state.result.main}, ${state.result.description.toUpperCase()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                    color: Colors.grey[400],
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 82),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        childAspectRatio: 1.8,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          AttributesCard(
                            title: "Temperature",
                            value:
                                "${(state.result.temperature - 273.15).roundToDouble().toString()}\u{00B0}c",
                          ),
                          AttributesCard(
                            title: "Pressure",
                            value: "${state.result.pressure.toString()}hPa",
                          ),
                          AttributesCard(
                            title: "Humidity",
                            value: "${state.result.humidity.toString()}%",
                          ),
                          AttributesCard(
                            title: "Wind",
                            value: "${state.result.windSpeed.toString()}mps E",
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Column(
                    children: [
                      searchField(),
                      const SizedBox(height: 42),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.60,
                        child: const Center(
                          child: DefaultResult(
                            icon: "assets/images/error.png",
                            response: "Location\nNot Available",
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.84,
                    child: const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget searchField() {
    return SearchField(
      onFocusChange: (focus) => _toggleSearch(),
      formGroup: form,
      controller: searchController,
      onSubmitted: () {
        context.read<WeatherBloc>().add(
              OnCityChanged(
                searchController.text,
              ),
            );
      },
      suffixIcon: (_isSearchIcon
          ? GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            )
          : SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.grey,
            )),
    );
  }
}
