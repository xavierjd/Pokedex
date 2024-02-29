import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banpay/models/pokemon_model.dart';

final pokemonUrlListProvider =
    StateNotifierProvider<PokemonUrlListNotifier, List<PokemonModel>>((ref) {
  return PokemonUrlListNotifier();
});

class PokemonUrlListNotifier extends StateNotifier<List<PokemonModel>> {
  PokemonUrlListNotifier() : super([]);

  void addPokemonsUrls(List<PokemonModel> newData) {
    state = [
      ...newData,
    ];
  }
}
