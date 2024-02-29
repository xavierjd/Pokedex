import 'package:flutter_test/flutter_test.dart';

import 'package:banpay/API/pokemon_api.dart';

void main() {
  group('POKEMON_API_TEST', () {
    test('RETURNED_POKEMON_DETAILS_LIST_IN_GET_POKEMON_BY_OFFSET_TEST',
        () async {
      // Init
      int offset = 0;
      // Do Action
      final result = await PokemonApi.getPokemonsByOffset(offset: offset);
      // Result
      expect(result, isNotEmpty);
      expect(result.first.id, 1);
      expect(result.first.name, 'bulbasaur');
      expect(result.first.height, 7);
      expect(result.first.weight, 69);
      expect(result.first.types[0].type.name, 'grass');
      expect(result.first.types[1].type.name, 'poison');
      expect(result.first.abilities[0].ability.name, 'overgrow');
      expect(result.first.sprites.other!.officialArtwork.frontDefault,
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png');
      expect(result.first.sprites.other!.officialArtwork.frontShiny,
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png');
    });

    test('RETURNED_POKEMON_DETAILS_IN_GET_POKEMON_DETAILS_BY_URL_TEST',
        () async {
      // Init
      String url = 'https://pokeapi.co/api/v2/pokemon/1/';
      // Do Action
      final result = await PokemonApi.getPokemonDetailsByUrl(url: url);
      // Result
      expect(result.id, 1);
      expect(result.name, 'bulbasaur');
      expect(result.height, 7);
      expect(result.weight, 69);
      expect(result.types, isNotEmpty);
      expect(result.types[0].type.name, 'grass');
      expect(result.types[1].type.name, 'poison');
      expect(result.abilities, isNotEmpty);
      expect(result.abilities[0].ability.name, 'overgrow');
      expect(result.sprites.other!.officialArtwork.frontDefault,
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png');
      expect(result.sprites.other!.officialArtwork.frontShiny,
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png');
    });

    test('RETURNED_NAME_AND_URL_IN_GET_POKEMON_BY_TYPE_TEST', () async {
      // Init
      int type = 1;
      // Do Action
      final result = await PokemonApi.getPokemonsByType(type: type);
      // Result
      expect(result, isNotEmpty);
      expect(result.first.name, 'pidgey');
      expect(result.first.url, 'https://pokeapi.co/api/v2/pokemon/16/');
    });

    test('RETURNED_NAME_AND_URL_IN_GET_ALL_POKEMONS_LIST_TEST', () async {
      // Init
      // Do Action
      final result = await PokemonApi.getAllPokemonsList();
      // Result
      expect(result, isNotEmpty);
      expect(result[0].name, 'bulbasaur');
      expect(result[0].url, 'https://pokeapi.co/api/v2/pokemon/1/');
      expect(result[1].name, 'ivysaur');
      expect(result[1].url, 'https://pokeapi.co/api/v2/pokemon/2/');
      expect(result[2].name, 'venusaur');
      expect(result[2].url, 'https://pokeapi.co/api/v2/pokemon/3/');
    });
  });
}
