import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get commonErrorMessage => 'Something went wrong. Please try later';

  @override
  String searchWeatherStatus(String city, num temp) {
    return '$city is $temp F';
  }

  @override
  String get searchCitiesNotFound => 'Not able to find such city';

  @override
  String get searchPlaceholder => 'Start typing to search cities';

  @override
  String get searchHint => 'Search';
}
