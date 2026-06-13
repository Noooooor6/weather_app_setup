import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit/weather_cubit.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherService()),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false,
              primarySwatch: getThemeColor(
                BlocProvider.of<WeatherCubit>(context)
                    .weatherModel
                    ?.watherCondition,
              )),
          home: HomeView(),
        );
      },
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.blueGrey;

    case 'Overcast':
      return Colors.indigo;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.blue;

    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Heavy snow':
    case 'Patchy heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.lightBlue;

    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy sleet possible':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.purple;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;

    case 'Thundery outbreaks possible':
      return Colors.deepPurple;

    default:
      return Colors.teal;
  }
}
