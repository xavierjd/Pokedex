import 'dart:io';
import 'package:dio/dio.dart';

import 'package:banpay/API/config.dart';
import 'package:banpay/models/pokemon_model.dart';
import 'package:banpay/models/pokemon_details_model.dart';

class PokemonApi {
  static Future<List<PokemonDetailsModel>> getPokemonsByOffset({
    int limit = 10,
    required int offset,
  }) async {
    List<PokemonDetailsModel> pokemonList = [];
    String url = Config.url + Config.pokemon;
    try {
      final response = await Dio().get(
        url,
        queryParameters: {
          'limit': limit.toString(),
          'offset': offset.toString()
        },
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
      );
      if (response.statusCode == 200) {
        final result = (response.data['results'] as List).map((res) {
          return PokemonModel.fromJson(res);
        }).toList();
        pokemonList = await Future.wait(result
            .map((res) => PokemonApi.getPokemonDetailsByUrl(url: res.url)));
      }
    } catch (e) {
      throw ('Network connection error');
    }
    return pokemonList;
  }

  static Future<PokemonDetailsModel> getPokemonDetailsByUrl(
      {required String url}) async {
    late PokemonDetailsModel pokemonDetails;
    try {
      final response = await Dio().get(
        url,
      );
      if (response.statusCode == 200) {
        pokemonDetails = PokemonDetailsModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Network connection error');
    }
    return pokemonDetails;
  }

  static Future<List<PokemonModel>> getPokemonsByType(
      {required int type}) async {
    late List<PokemonModel> pokemonTypeUrlList;
    String url = Config.url + Config.type + type.toString();
    try {
      final response = await Dio().get(
        url,
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
      );

      if (response.statusCode == 200) {
        pokemonTypeUrlList = (response.data['pokemon'] as List).map(
          (item) {
            return PokemonModel.fromJson(item['pokemon']);
          },
        ).toList();
      }
    } catch (e) {
      throw Exception('Network connection error');
    }
    return pokemonTypeUrlList;
  }

  static Future<List<PokemonModel>> getAllPokemonsList() async {
    List<PokemonModel> pokemonsList = [];
    String url = Config.url + Config.pokemon;
    try {
      final response = await Dio().get(
        url,
        queryParameters: {
          'limit': '100000',
          'offset': '0',
        },
      );
      if (response.statusCode == 200) {
        pokemonsList = (response.data['results'] as List).map((item) {
          return PokemonModel.fromJson(item);
        }).toList();
      }
    } catch (e) {
      throw ('Network connection error');
    }
    return pokemonsList;
  }
}
