import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banpay/API/pokemon_api.dart';
import 'package:banpay/models/pokemon_details_model.dart';
import 'package:banpay/provider/pokemon_url_list_provider.dart';
import 'package:banpay/provider/functions_provider.dart';

final searchPokemonProvider = StateNotifierProvider<SearchQuery, String>((ref) {
  return SearchQuery();
});

class SearchQuery extends StateNotifier<String> {
  SearchQuery() : super('');

  void updateSearchQuery(String searchQuery) {
    state = searchQuery;
  }
}

final fetchPokemonSearchProvider =
    StateNotifierProvider<SearchPokemon, List<PokemonDetailsModel>>((ref) {
  return SearchPokemon(ref);
});

class SearchPokemon extends StateNotifier<List<PokemonDetailsModel>> {
  SearchPokemon(this.ref) : super([]);

  final Ref ref;

  Future<List<PokemonDetailsModel>> fetchPokemonSearchResults(
      int offset, String searchQuery) async {
    final allPokemonsList = await PokemonApi.getAllPokemonsList();
    ref
        .read(pokemonUrlListProvider.notifier)
        .addPokemonsUrls(allPokemonsList.where(
          (element) {
            return element.name.toString().contains(searchQuery);
          },
        ).toList());
    final pokemonUrlList = ref.read(pokemonUrlListProvider);
    return await getPokemonDetailsFromList(
        offset: offset, pokemonUrlList: pokemonUrlList);
  }
}
