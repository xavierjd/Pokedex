import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banpay/provider/functions_provider.dart';
import 'package:banpay/API/pokemon_api.dart';
import 'package:banpay/models/pokemon_details_model.dart';
import 'package:banpay/provider/pokemon_url_list_provider.dart';

final pokemonTypeProvider = StateNotifierProvider<PokemonType, int>((ref) {
  return PokemonType();
});

class PokemonType extends StateNotifier<int> {
  PokemonType() : super(0);

  void updatePokemonType(int pokemonType) {
    state = pokemonType;
  }
}

final fetchPokemonTypeProvider =
    StateNotifierProvider<FetchPokemonType, List<PokemonDetailsModel>>((ref) {
  return FetchPokemonType(ref);
});

class FetchPokemonType extends StateNotifier<List<PokemonDetailsModel>> {
  FetchPokemonType(this.ref) : super([]);

  final Ref ref;

  Future<List<PokemonDetailsModel>> fetchPokemonType(
      int selectedType, int offset) async {
    ref.read(pokemonUrlListProvider.notifier).addPokemonsUrls(
        await PokemonApi.getPokemonsByType(type: selectedType));
    final pokemonUrlList = ref.read(pokemonUrlListProvider);
    return await getPokemonDetailsFromList(
        offset: offset, pokemonUrlList: pokemonUrlList);
  }
}
