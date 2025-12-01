import 'package:f2p_games_api/providers/games_provider.dart';
import 'package:f2p_games_api/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final int game = ModalRoute.of(context)?.settings.arguments as int;
    final gamesProvider = Provider.of<GamesProvider>(context);
    gamesProvider.getGameDetails(game);

    return gamesProvider.gameDetails == null
    ? const Center(
      
      child: CircularProgressIndicator(),
    )
    : Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 118, 122, 123), 
                Color.fromARGB(255, 91, 93, 94), 
              ],
            ),
          ),
        child: CustomScrollView(
          
          slivers: [
            
            _CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _PosterAndTitle(),
                  _Overview(),
                  //Text('Url: '+ gamesProvider.gameDetails!.gameUrl, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
                  Link(
                    uri: Uri.parse(gamesProvider.gameDetails!.gameUrl),
                    target: LinkTarget.blank,
                    builder: (context, followLink) => GestureDetector(
                    onTap: followLink,
                      child: Text(
                        gamesProvider.gameDetails!.gameUrl,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  ScreenshotSwiper(screenshots: gamesProvider.gameDetails!.screenshots),
                ]
              )
            )
          ]
        ),
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    final gamesProvider = Provider.of<GamesProvider>(context);
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
            gamesProvider.gameDetails!.title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(gamesProvider.gameDetails!.thumbnail),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gamesProvider = Provider.of<GamesProvider>(context);
    final size = MediaQuery.of(context).size;
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
              image: NetworkImage(gamesProvider.gameDetails!.thumbnail,),
              height: 150,
              width: size.width * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gamesProvider.gameDetails!.title,
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.verified_user, size: 15, color: Colors.grey),
                    Expanded(
                      child: Text(
                        gamesProvider.gameDetails!.publisher,
                        style: textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  
                  ]
                ),
                Row(
                  children: [
                    //const Icon(Icons.air_sharp, size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('Categoria: '+ gamesProvider.gameDetails!.genre, style: textTheme.bodySmall, overflow: TextOverflow.ellipsis,),
                  ],
                ),
                //Text('Plataforma: '+ gamesProvider.gameDetails!.platform, style: textTheme.bodySmall, overflow: TextOverflow.ellipsis,),
              ],
            ),
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
        gamesProvider.gameDetails!.description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}