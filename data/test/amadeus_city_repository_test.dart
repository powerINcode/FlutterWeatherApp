import 'package:core/data/data.dart';
import 'package:data/src/dto/city_search_dto/address_dto.dart';
import 'package:data/src/dto/city_search_dto/city_search_dto.dart';
import 'package:data/src/dto/city_search_dto/data_dto.dart';
import 'package:data/src/dto/city_search_dto/geo_code_dto.dart';
import 'package:data/src/repositories/amadeus_city_repository.dart';
import 'package:domain/index.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  late AmadeusCityRepository repository;
  late MockAmadeusCityService service;

  setUp(() {
    service = MockAmadeusCityService();

    repository = AmadeusCityRepository(service: service);
  });

  test(
      'GIVEN search city by name WHEN search THEN service call searchCity with exact query and return domain model',
      () async {
    // arrange
    const query = 'Paris';
    const cityDto = CitySearchDto(data: [
      DataDto(
          id: 'id',
          type: 'type',
          subType: 'subType',
          name: 'name',
          detailedName: 'detailedName',
          timeZoneOffset: 'timeZoneOffset',
          iataCode: 'iataCode',
          address: AddresDto(
            cityName: 'cityName',
            cityCode: 'cityCode',
            countryName: 'countryName',
            countryCode: 'countryCode',
            regionCode: 'regionCode',
          ),
          geoCode: GeoCodeDto(latitude: 0, longitude: 0))
    ]);

    final expected = Data.value(
      value: [
        City(
          cityName: 'cityName',
          cityCode: 'cityCode',
          countryName: 'countryName',
          countryCode: 'countryCode',
          regionCode: 'regionCode',
          lat: 0,
          lon: 0,
        )
      ],
    );

    when(() => service.searchCity(keyword: any(named: 'keyword')))
        .thenAnswer((_) async => Future.value(cityDto));

    // act
    final actual = await repository.search(query);

    // assert
    verify(() => service.searchCity(keyword: query)).called(1);
    expect(actual, expected);
  });
}
