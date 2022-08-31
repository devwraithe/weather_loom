import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_weather/src/core/utils/api_utils.dart';
import 'package:open_weather/src/presentation/widgets/attributes_card.dart';
import 'package:open_weather/src/presentation/widgets/default_response.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.42,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 11,
                  ),
                  child: FocusScope(
                    child: Focus(
                      onFocusChange: (focus) => _toggleSearch(),
                      child: TextFormField(
                        strutStyle: StrutStyle.disabled,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: (query) {
                          context.read<WeatherBloc>().add(OnCityChanged(query));
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          suffixIcon: (_isSearchIcon
                              ? GestureDetector(
                                  onTap: () {
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      "Cancel",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                )
                              : SvgPicture.asset(
                                  "assets/icons/search.svg",
                                  color: Colors.black,
                                )),
                          prefixIconColor: Colors.white,
                          hintText: "Search by country, city...",
                          hintStyle:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 24,
                            minWidth: 24,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.64,
                        child: const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      );
                    } else if (state is WeatherHasData) {
                      return Column(
                        key: const Key('weather_data'),
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 42),
                            child: Column(
                              children: [
                                Text(
                                  "${state.result.cityName} Forecast",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(height: 28),
                                // SvgPicture.asset(
                                //   "assets/icons/sunny.svg",
                                //   width: 84,
                                //   height: 84,
                                // ),
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
                                const SizedBox(height: 28),
                                Text(
                                  "${state.result.temperature}\u{00B0}c",
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
                                    "${state.result.temperature.toString()}\u{00B0}c",
                              ),
                              AttributesCard(
                                title: "Pressure",
                                value: "${state.result.pressure.toString()}pa",
                              ),
                              AttributesCard(
                                title: "Humidity",
                                value: "${state.result.humidity.toString()}gm",
                              ),
                              AttributesCard(
                                title: "Wind",
                                value:
                                    "${state.result.windSpeed.toString()}m/s",
                              ),
                            ],
                          ),
                        ],
                      );
                    } else if (state is WeatherError) {
                      return const DefaultResult(
                        icon: "assets/images/error.png",
                        response: "Location\nNot Available",
                      );
                    } else {
                      return const DefaultResult(
                        icon: "assets/images/search.png",
                        response: "Search a Location",
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
