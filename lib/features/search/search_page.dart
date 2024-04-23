import 'package:core/data/data.dart';
import 'package:domain/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    onChanged: (value) {
                      cubit.search(_controller.text);
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: city != null && weather != null
                        ? Text('${city.cityName} is ${weather.temp} F')
                        : const Text(''),
                  ),
                  if (_controller.text.isEmpty)
                    const _InitialState()
                  else if (citiesData != null)
                    Expanded(
                      child: LoadingContainer(
                          data: citiesData,
                          errorBuilder: (context) => Center(child: Text('Error')),
                          valueBuilder: (context, cities, loading) {
                            if (!loading && cities.isEmpty && _controller.text.isNotEmpty) {
                              return Center(child: Text('Not able to find such city'));
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
  const _InitialState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text('Start typing to search cities'),
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
  final ValueSetter<City> onSelectCity;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      itemBuilder: (context, index) {
        final city = cities[index];

        return InkWell(
          onTap: () {
            onSelectCity(city);
          },
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(city.cityName),
          )),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemCount: cities.length,
    );
  }
}

class LoadingContainer<T> extends StatelessWidget {
  const LoadingContainer({
    super.key,
    required this.data,
    required this.errorBuilder,
    required this.valueBuilder,
  });

  final Data<T> data;
  final WidgetBuilder errorBuilder;
  final Function(BuildContext, T value, bool loading) valueBuilder;

  @override
  Widget build(BuildContext context) {
    final value = data.value;
    return Stack(
      children: [
        if (data.hasError) Positioned.fill(child: errorBuilder(context)),
        if (value != null)
          Positioned.fill(
              child: valueBuilder(
            context,
            value,
            data.loading,
          )),
        if (data.loading)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
