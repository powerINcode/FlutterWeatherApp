import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfiguration {
  const EnvironmentConfiguration({
    required this.amadeusUrl,
    required this.amadeusClientId,
    required this.amadeusClientSecret,
    required this.openWeatherUrl,
    required this.openWeatherApiKey,
  });

  static const development = 'environment/development.env';

  final String amadeusUrl;
  final String amadeusClientId;
  final String amadeusClientSecret;
  final String openWeatherUrl;
  final String openWeatherApiKey;
}

extension DotEnvExt on DotEnv {
  EnvironmentConfiguration loadEnvironment() {
    return EnvironmentConfiguration(
      amadeusUrl: dotenv.env['AMADEUS_URL']!,
      amadeusClientId: dotenv.env['AMADEUS_CLIENT_ID']!,
      amadeusClientSecret: dotenv.env['AMADEUS_CLIENT_SECRET']!,
      openWeatherUrl: dotenv.env['OPEN_WEATHER_URL']!,
      openWeatherApiKey: dotenv.env['OPEN_WEATHER_API_KEY']!,
    );
  }
}
