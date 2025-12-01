import 'package:f2p_games_api/models/games_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class CardSwiper extends StatelessWidget {
  
  final List<GamesResponse> games;
  
  const CardSwiper({super.key, required this.games});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.games.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

     return Container(
        width: double.infinity,
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.3,
        // color: Colors.red,
        child: Swiper(
          itemCount: games.length,
          layout: SwiperLayout.DEFAULT,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final game = games[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'game details'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(game.thumbnail),
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}