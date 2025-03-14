import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class PokeApiService {
  static const String baseUrl = 'https://pokeapi.co/api/v2/';

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse('${baseUrl}pokemon?limit=50'));

    if (response.statusCode == 200) {
      List results = json.decode(response.body)['results'];
      List<Pokemon> pokemons = [];

      for (var item in results) {
        final detailResponse = await http.get(Uri.parse(item['url']));
        if (detailResponse.statusCode == 200) {
          pokemons.add(Pokemon.fromJson(json.decode(detailResponse.body)));
        }
      }
      return pokemons;
    } else {
      throw Exception('Falha ao carregar Pokémon');
    }
  }
}