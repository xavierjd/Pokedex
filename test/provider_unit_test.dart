import 'package:banpay/provider/pokemon_type_provider.dart';
import 'package:banpay/provider/search_pokemon_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:banpay/provider/offset_provider.dart';

void main() {
  group('OFFSET_PROVIDER_TEST', () {
    test('RETURNED_ZERO_IN_OFFSET_PROVIDER_TEST', () {
      // Init
      final container = ProviderContainer();
      // Do Action
      final offset = container.read(offsetProvider);
      // Result
      expect(offset, 0);
    });

    test('RETURNED_TEN_IN_INCREMENT_OFFSET_PROVIDER_TEST', () {
      // Init
      final container = ProviderContainer();
      // Do Action
      container.read(offsetProvider.notifier).increment();
      final offset = container.read(offsetProvider);
      // Result
      expect(offset, 10);
    });
    test('RETURNED_TWENTY_IN_DECREMENT_OFFSET_PROVIDER_TEST', () {
      // Init
      final container = ProviderContainer();
      // Do Action
      container.read(offsetProvider.notifier).increment();
      container.read(offsetProvider.notifier).increment();
      container.read(offsetProvider.notifier).increment();
      container.read(offsetProvider.notifier).decrement();
      final offset = container.read(offsetProvider);
      // Result
      expect(offset, 20);
    });

    test('RETURNED_ZERO_IN_CLEAR_OFFSET_PROVIDER_TEST', () {
      // Init
      final container = ProviderContainer();
      // Do Action
      container.read(offsetProvider.notifier).increment();
      container.read(offsetProvider.notifier).clear();
      final offset = container.read(offsetProvider);
      // Result
      expect(offset, 0);
    });
  });

  group('SEARCH_POKEMON_PROVIDER_TEST', () {
    test('RETURNED_SEARCHED_POKEMON_LIST_IN_FETCH_POKEMON_SEARCH_PROVIDER_TEST',
        () async {
      // Init
      final container = ProviderContainer();
      const searchQuery = 'char';
      const offset = 0;
      // Do Action
      final searchList = await container
          .read(fetchPokemonSearchProvider.notifier)
          .fetchPokemonSearchResults(offset, searchQuery);
      // Result
      expect(searchList, isNotEmpty);
      expect(searchList.first.id, 4);
      expect(searchList.first.name, 'charmander');
    });
  });

  group('POKEMON_TYPE_PROVIDER_TEST', () {
    test('RETURNED_POKEMON_TYPE_LIST_IN_FETCH_POKEMON_TYPE_PROVIDER_TEST',
        () async {
      // Init
      final container = ProviderContainer();
      const selectedType = 1;
      const offset = 0;
      // Do Action
      final searchList = await container
          .read(fetchPokemonTypeProvider.notifier)
          .fetchPokemonType(selectedType, offset);
      // Result
      expect(searchList, isNotEmpty);
      expect(searchList[0].id, 16);
      expect(searchList[0].name, 'pidgey');
      expect(searchList[1].id, 17);
      expect(searchList[1].name, 'pidgeotto');
      expect(searchList[2].id, 18);
      expect(searchList[2].name, 'pidgeot');
    });
  });
}
