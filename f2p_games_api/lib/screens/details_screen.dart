import 'package:f2p_games_api/providers/games_provider.dart';
import 'package:f2p_games_api/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final String game = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-game';
    final gamesProvider = Provider.of<GamesProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(),
                _Overview(),
                CardSwiper(games: []),
              ]
            )
          )
        ]
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Títol peli',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://placehold.co/500x300/png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://placehold.co/200x300/png'),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                'Títol peli',
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Títol original',
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('Nota mitjana', style: textTheme.bodySmall),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gamesProvider = Provider.of<GamesProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        gamesProvider.gameDetails.description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}