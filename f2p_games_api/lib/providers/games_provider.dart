import 'dart:convert';
import 'package:f2p_games_api/models/games_response.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class GamesProvider extends ChangeNotifier{
  final String _url = 'https://www.freetogame.com/api/games';
  

  List<GamesResponse> allGames = [];
  List<GamesResponse> categoryGames = [];

  GamesProvider(){
    print("Cargando juegos...");
    this.getAllGames();
    this.getCategoryGames('shooter');
  }

  getAllGames() async{
    print("Todos los juegos");
    var url = Uri.parse(this._url);
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final List jsonList = json.decode(result.body);
      allGames = jsonList.map((json) => GamesResponse.fromMap(json)).toList();
      print("Juegos cargados");
    } else {
      throw Exception('Failed to load games');

    }
    /*final allGamesResponse = GamesResponse.fromJson(result.body);
    allGames = allGamesResponse.results;*/
    print(allGames.map((game) => game.title).toList());

    notifyListeners();
  }

  getCategoryGames(categoryName) async{
    print("Juegos por categoria");
    var url = Uri.https(
      'www.freetogame.com',
      '/api/games',
      {
        'category': categoryName
      }
    );
    print(url.toString());
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final List jsonList = json.decode(result.body);
      categoryGames = jsonList.map((json) => GamesResponse.fromMap(json)).toList();
      print("Juegos cargados");
    } else {
      throw Exception('Failed to load games');

    }
    /*final categoryGamesResponse = GamesResponse.fromJson(result.body);
    categoryGames = categoryGamesResponse.results;*/
    print(categoryGames.map((game) => game.title).toList());

    notifyListeners();
  }
  

  
}