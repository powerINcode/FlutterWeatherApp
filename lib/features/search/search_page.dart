import 'package:core/widgets/loading_container.dart';
import 'package:domain/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/extensions/build_context_extensions.dart';
import 'package:flutter_weather_app/features/search/search_cubit.dart';
import 'package:flutter_weather_app/features/search/search_state.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<SearchCubit>()..init(),
      child: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
        final citiesData = state.cities;
        final city = state.selectedCity;
        final weather = state.weather;
        final cubit = context.read<SearchCubit>();

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _controller,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(hintText: context.localize.searchHint),
                    onChanged: (value) {
                      cubit.search(_controller.text);
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: city != null && weather != null
                        ? Text(
                            context.localize.searchWeatherStatus(
                              city.cityName,
                              weather.temp,
                            ),
                          )
                        : const Text(''),
                  ),
                  if (_controller.text.isEmpty)
                    const _InitialState()
                  else if (citiesData != null)
                    Expanded(
                      child: LoadingContainer(
                          data: citiesData,
                          errorBuilder: (context) =>
                              Center(child: Text(context.localize.commonErrorMessage)),
                          valueBuilder: (context, cities, loading) {
                            if (!loading && cities.isEmpty && _controller.text.isNotEmpty) {
                              return Center(child: Text(context.localize.searchCitiesNotFound));
                            }

                            return _CitiesList(
                              cities: cities,
                              onSelectCity: cubit.selectCity,
                            );
                          }),
                    )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _InitialState extends StatelessWidget {
  const _InitialState();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(context.localize.searchPlaceholder),
      ),
    );
  }
}

class _CitiesList extends StatelessWidget {
  const _CitiesList({
    required this.cities,
    required this.onSelectCity,
  });

  final List<City> cities;
  final AsyncValueSetter<City> onSelectCity;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      itemBuilder: (context, index) {
        final city = cities[index];

        return _CityCard(onSelectCity: onSelectCity, city: city);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemCount: cities.length,
    );
  }
}

class _CityCard extends StatefulWidget {
  const _CityCard({
    required this.onSelectCity,
    required this.city,
  });

  final AsyncValueSetter<City> onSelectCity;
  final City city;

  @override
  State<_CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<_CityCard> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _loading
          ? null
          : () async {
              setState(() {
                _loading = true;
              });
              await widget.onSelectCity(widget.city);
              setState(() {
                _loading = false;
              });
            },
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.city.cityName),
                if (_loading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(),
                  )
              ],
            )),
      ),
    );
  }
}
