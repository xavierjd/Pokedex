import 'package:banpay/consts/consts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banpay/provider/all_pokemons_provider.dart';
import 'package:banpay/provider/offset_provider.dart';
import 'package:banpay/models/pokemon_model.dart';
import 'package:banpay/provider/search_pokemon_provider.dart';
import 'package:banpay/provider/pokemon_type_provider.dart';
import 'package:banpay/API/pokemon_api.dart';
import 'package:banpay/models/pokemon_details_model.dart';

enum PokedexFunction {
  showAllPokemons,
  searchPokemon,
  showPokemontype,
}

final functionsProvider =
    StateNotifierProvider<SelectFunction, PokedexFunction>((ref) {
  return SelectFunction();
});

class SelectFunction extends StateNotifier<PokedexFunction> {
  SelectFunction() : super(PokedexFunction.showAllPokemons);

  void changeFunction(PokedexFunction selectedFunction) {
    state = selectedFunction;
  }
}

//
final selectedFunctionProvider =
    FutureProvider<List<PokemonDetailsModel>>((ref) async {
  final offset = ref.watch(offsetProvider);
  final searchQuery = ref.watch(searchPokemonProvider);
  final selectedType = ref.watch(pokemonTypeProvider);

  final selectedFunction = ref.watch(functionsProvider);

  switch (selectedFunction) {
    case PokedexFunction.showAllPokemons:
      return await ref
          .read(allPokemonProvider.notifier)
          .fetchAllPokemons(offset);

    case PokedexFunction.showPokemontype:
      return await ref
          .read(fetchPokemonTypeProvider.notifier)
          .fetchPokemonType(selectedType, offset);

    case PokedexFunction.searchPokemon:
      return await ref
          .read(fetchPokemonSearchProvider.notifier)
          .fetchPokemonSearchResults(offset, searchQuery);
  }
});

Future<List<PokemonDetailsModel>> getPokemonDetailsFromList({
  required int offset,
  required List<PokemonModel> pokemonUrlList,
}) async {
  List<PokemonDetailsModel> pokemonList = [];
  int end;

  if (offset + delta > pokemonUrlList.length) {
    end = pokemonUrlList.length;
  } else {
    end = offset + delta;
  }

  for (int i = offset; i < end; i++) {
    final pokemon =
        await PokemonApi.getPokemonDetailsByUrl(url: pokemonUrlList[i].url);
    pokemonList.add(pokemon);
  }

  return pokemonList;
}
