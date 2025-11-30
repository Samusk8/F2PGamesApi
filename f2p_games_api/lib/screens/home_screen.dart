import 'package:f2p_games_api/providers/games_provider.dart';
import 'package:f2p_games_api/widgets/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:f2p_games_api/providers/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<GamesProvider>(context);
    //final games = moviesProvider.games;
    final games = [1,2,3,4,5];
    String selectedCategory = 'shooter';
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              CardSwiper(games: games),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Text('Categories',),

              DropdownButton<String>(
                value: selectedCategory,
                items: categories.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat),
                  );
                }).toList(),
                onChanged: (value) {
                  /*ChangeNotifier(() {
                    selectedCategory = value!;
                  });*/
                },
              )
                ],
              ),


            ],
          ),
        ),
      )
    );
  }
}