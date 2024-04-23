import 'package:flutter/material.dart';
import 'package:flutter_weather_app/features/search/search_page.dart';
import 'package:flutter_weather_app/features/search/search_state.dart';
import 'package:go_router/go_router.dart';

part 'router.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
