import 'package:flutter/material.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:open_weather/src/core/utilities/helpers/current_city_helper.dart';
import 'package:open_weather/src/presentation/widgets/city_overview.dart';
import 'package:open_weather/src/presentation/widgets/day_forecast.dart';
import 'package:open_weather/src/presentation/widgets/weather_attributes.dart';

import '../../core/constants/imports_barrel.dart';
import '../widgets/daily_forecast.dart';

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
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CityOverview(),
              SizedBox(height: 20),
              HourForecast(),
              SizedBox(height: 18),
              DayForecast(),
              SizedBox(height: 18),
              WeatherAttributes(),
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
