import 'package:f2p_games_api/providers/categories_provider.dart';
import 'package:f2p_games_api/providers/games_provider.dart';
import 'package:f2p_games_api/providers/platforms_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final gamesProvider = Provider.of<GamesProvider>(context);
    final categoriesProvider = context.watch<CategoriesProvider>();

    final selectedCategory = categoriesProvider.getSelectedCategory;
    final categories = categoriesProvider.getCategories;

    final platformsProvider = context.watch<PlatformsProvider>();

    final selectedPlatform = platformsProvider.getSelectedPlatform;
    final platforms = platformsProvider.getPlatforms;
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
              Text('Categories:',),

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
              StackSwiper(games: gamesProvider.categoryGames),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Text('Platform:',),

              DropdownButton<String>(
                value: selectedPlatform,
                items: platforms.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat),
                  );
                }).toList(),
                onChanged: (value) {
                  context.read<PlatformsProvider>().setSelectedPlatform(value!);
                  gamesProvider.getPlatformGames(value);
                },
              )
                ],
              ),
              StackSwiper(games: gamesProvider.platformGames),
              
              

            ],
          ),
        ),
      )
    );
  }
}