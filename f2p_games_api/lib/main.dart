import 'package:f2p_games_api/providers/categories_provider.dart';
import 'package:f2p_games_api/providers/games_provider.dart';
import 'package:flutter/material.dart';


import 'package:f2p_games_api/screens/screens.dart';
import 'package:provider/provider.dart';
//import 'package:f2p_games_api/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GamesProvider(), lazy: false,),
        ChangeNotifierProvider(create: (_)=> CategoriesProvider(), lazy: false,)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pel·lícules',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'details': (BuildContext context) => DetailsScreen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo)),
    );
  }
}
