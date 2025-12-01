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
        title: Text('Home', style: TextStyle(color: Colors.white),),
        actions: [
           Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.account_circle_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 2,
        animateColor: true,
        flexibleSpace: AnimatedContainer(
          duration: Duration(seconds: 3),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 90, 93, 93), 
                Color.fromARGB(255, 58, 60, 60), 
                Color.fromARGB(255, 53, 54, 54), 
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 118, 122, 123), 
                Color.fromARGB(255, 66, 67, 67), 
              ],
            ),
          ),
          child: Column(
            children: [
              CardSwiper(games: gamesProvider.allGames),
              Container(
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 30, 31, 31), 
                      Color.fromARGB(255, 64, 67, 67), 
                      Color.fromARGB(255, 85, 91, 91), 
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Text('Categories:',style: TextStyle(color: Colors.white),),
                
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
              ),
              Padding(padding:  EdgeInsets.only(top: 20)),
              StackSwiper(games: gamesProvider.categoryGames),
              Padding(padding:  EdgeInsets.only(top: 20)),
              Container(
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 30, 31, 31), 
                      Color.fromARGB(255, 64, 67, 67), 
                      Color.fromARGB(255, 85, 91, 91), 
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Text('Platform:', style: TextStyle(color: Colors.white,),),
                
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
              ),
              Padding(padding:  EdgeInsets.only(top: 20)),
              StackSwiper(games: gamesProvider.platformGames),
              
              

            ],
          ),
        ),
      )
    );
  }
}