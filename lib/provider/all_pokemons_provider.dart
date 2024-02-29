import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:banpay/API/pokemon_api.dart';
import 'package:banpay/models/pokemon_details_model.dart';

final allPokemonProvider =
    StateNotifierProvider<AllPokemons, List<PokemonDetailsModel>>((ref) {
  return AllPokemons();
});

class AllPokemons extends StateNotifier<List<PokemonDetailsModel>> {
  AllPokemons() : super([]);
  bool _isCachedData = false;
  List<PokemonDetailsModel> _cachedPokemonList = [];

  final _delta = 10;

  Future<List<PokemonDetailsModel>> fetchAllPokemons(int offset) async {
    _isCachedData = await APICacheManager().isAPICacheKeyExist('all_pokemons');
    if (_isCachedData) {
      final cachedData = await APICacheManager().getCacheData('all_pokemons');
      _cachedPokemonList = List<PokemonDetailsModel>.from(
        jsonDecode(cachedData.syncData)
            .map((element) => PokemonDetailsModel.fromJson(element))
            .toList(),
      );
    }
    //if cached data does not exist
    if (!_isCachedData) {
      // Retrieve Data from API
      final pokemonList = await PokemonApi.getPokemonsByOffset(offset: offset);
      // Load Data in List
      _cachedPokemonList.addAll(pokemonList);
      // Save Cached Data
      APICacheDBModel cacheModel = APICacheDBModel(
          key: 'all_pokemons',
          syncData: jsonEncode(
              _cachedPokemonList.map((item) => item.toJson()).toList()));

      await APICacheManager().addCacheData(cacheModel);

      return pokemonList;
    } else {
      // Go Online
      if (offset + _delta > _cachedPokemonList.length) {
        // Retrieve Data from API
        final pokemonList =
            await PokemonApi.getPokemonsByOffset(offset: offset);
        // Load Data in List
        _cachedPokemonList.addAll(pokemonList);
        // Save Cached Data
        APICacheDBModel cacheModel = APICacheDBModel(
            key: 'all_pokemons',
            syncData: jsonEncode(
                _cachedPokemonList.map((item) => item.toJson()).toList()));
        await APICacheManager().addCacheData(cacheModel);

        return pokemonList;
      } else {
        // Go offline
        return _cachedPokemonList.sublist(offset, offset + _delta);
      }
    }
  }
}
