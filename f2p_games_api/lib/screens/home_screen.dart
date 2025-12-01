import 'package:f2p_games_api/providers/categories_provider.dart';
import 'package:f2p_games_api/providers/games_provider.dart';
import 'package:f2p_games_api/widgets/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final gamesProvider = Provider.of<GamesProvider>(context);
    final categoriesProvider = context.watch<CategoriesProvider>();

    final selectedCategory = categoriesProvider.getSelectedCategory;
    final categories = categoriesProvider.getCategories;
    //final games = gamesProvider.games;
    
    
    
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
              CardSwiper(games: gamesProvider.allGames),
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
                  context.read<CategoriesProvider>().setSelectedCategory(value!);
                  gamesProvider.getCategoryGames(value);
                },
              )
                ],
              ),
              CardSwiper(games: gamesProvider.categoryGames),
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
                  context.read<CategoriesProvider>().setSelectedCategory(value!);
                  gamesProvider.getCategoryGames(value);
                },
              )
                ],
              ),
              CardSwiper(games: gamesProvider.categoryGames),
              
              

            ],
          ),
        ),
      )
    );
  }
}