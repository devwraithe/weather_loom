import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/core/utilities/helpers/current_city_helper.dart';
import 'package:open_weather/src/presentation/widgets/city_overview.dart';

import '../../core/constants/imports_barrel.dart';

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

  // Get the weather information for the current city
  void currentCityInfo() async {
    final city = await getCurrentCity();
    debugPrint("My current city is $city");
    context.read<WeatherBloc>().add(OnCityChanged(city));
  }

  @override
  void initState() {
    searchController;
    super.initState();
    currentCityInfo();
  }

  final form = FormGroup({
    'searchLocation': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CityOverview(),
              const SizedBox(height: 30),
              // 24 Hour Forecast
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "24 Hour Forecast",
                      style: textTheme.subtitle2?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              BlocBuilder<ForecastBloc, ForecastState>(
                  builder: (context, state) => state is ForecastIsLoading
                      ? const DataLoader(height: 0.2)
                      : state is ForecastHasData
                          ? SizedBox(
                              height: 88,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 22),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.result.length,
                                itemBuilder: (context, index) {
                                  final hour = state.result[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat('ha').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            hour.time * 1000,
                                            isUtc: false,
                                          ),
                                        ),
                                        style: textTheme.bodyText1?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      CachedNetworkImage(
                                        imageUrl: ApiUrls.weatherIcon(
                                          hour.icon,
                                        ),
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CupertinoActivityIndicator(),
                                        ),
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                        width: 36,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "${state.result[index].temp.round().toString()}\u{00B0}c",
                                        style: textTheme.bodyText1?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          : state is ForecastHasError
                              ? const ErrorResponse(
                                  height: 0.2,
                                  title: "24 Hour Forecast is Unavailable!")
                              : const ErrorResponse(
                                  height: 0.2,
                                  title: "Preparing 24 Hour Forecast...")),
              const SizedBox(height: 40),
              // 16 Days Forecast
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "7 Days Forecast",
                      style: textTheme.subtitle2?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  BlocBuilder<DailyForecastBloc, DailyForecastState>(
                      builder: (context, state) => state
                              is DailyForecastIsLoading
                          ? const DataLoader(height: 0.2)
                          : state is DailyForecastHasData
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Column(
                                    children: [
                                      for (var day in state.result)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  DateFormat('MMMM d,EEEE').format(
                                                              DateTime.fromMillisecondsSinceEpoch(
                                                                  day.dailyTime
                                                                          .toInt() *
                                                                      1000,
                                                                  isUtc:
                                                                      false)) ==
                                                          DateFormat(
                                                                  'MMMM d,EEEE')
                                                              .format(DateTime
                                                                  .now())
                                                      ? "Today"
                                                      : DateFormat.EEEE()
                                                          .format(
                                                          DateTime.fromMillisecondsSinceEpoch(
                                                              day.dailyTime
                                                                      .toInt() *
                                                                  1000,
                                                              isUtc: false),
                                                        ),
                                                  style: textTheme.bodyText1
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 6,
                                                  ),
                                                  child: Image.network(
                                                    ApiUrls.weatherIcon(
                                                      day.dailyIcon,
                                                    ),
                                                    width: 36,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "${day.dailyMinTemp.round().toString()}\u{00B0}c to ${day.dailyMaxTemp.round().toString()}\u{00B0}c",
                                                  textAlign: TextAlign.end,
                                                  style: textTheme.bodyText1
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              : state is DailyForecastHasError
                                  ? const ErrorResponse(
                                      height: 0.2,
                                      title: "7 Days Forecast is Unavailable!")
                                  : const ErrorResponse(
                                      height: 0.2,
                                      title: "Preparing 7 Days Forecast...")),
                ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => state is WeatherLoading
                        ? const DataLoader(height: 0.4)
                        : state is WeatherHasData
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Attribute(
                                        title: "WIND",
                                        value:
                                            "${state.result.windSpeed.toString()} MPH",
                                      ),
                                      Attribute(
                                        title: "HUMIDITY",
                                        value:
                                            "${state.result.humidity.toString()}%",
                                      ),
                                      Attribute(
                                        title: "PRESSURE",
                                        value:
                                            "${state.result.pressure.toString()} inHg",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 22),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Attribute(
                                        title: "SUNRISE",
                                        value: DateFormat('h:mma').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            state.result.sunrise.toInt() * 1000,
                                            isUtc: false,
                                          ),
                                        ),
                                      ),
                                      Attribute(
                                        title: "SUNSET",
                                        value: DateFormat('h:mma').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            state.result.sunset.toInt() * 1000,
                                            isUtc: false,
                                          ),
                                        ),
                                      ),
                                      Attribute(
                                        title: "FEELS LIKE",
                                        value:
                                            "${state.result.feelsLike.round().toString()}\u{00B0}c",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 26),
                                ],
                              )
                            : state is ForecastHasError
                                ? const ErrorResponse(
                                    height: 0.4,
                                    title: "Attributes are Unavailable!")
                                : const ErrorResponse(
                                    height: 0.4,
                                    title: "Preparing Attributes...")),
              ),
            ],
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
                padding: const EdgeInsets.only(top: 2),
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
