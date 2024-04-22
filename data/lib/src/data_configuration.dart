/// Configuration for the data layer
class DataConfiguration {
  const DataConfiguration({
    required this.amadeus,
    required this.openWeather,
  });

  final AmadeusConfiguration amadeus;
  final OpenWeatherConfiguration openWeather;
}

class AmadeusConfiguration {
  const AmadeusConfiguration({
    required this.url,
    required this.clientId,
    required this.clientSecret,
  });

  final String url;
  final String clientId;
  final String clientSecret;
}

class OpenWeatherConfiguration {
  const OpenWeatherConfiguration({required this.url, required this.apiKey});

  final String url;
  final String apiKey;

}
