import 'package:flutter/widgets.dart';
import 'package:flutter_weather_app/l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get localize => AppLocalizations.of(this);
}
