
import 'package:f2p_games_api/providers/games_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import '../models/models.dart';

class ScreenshotSwiper extends StatelessWidget {
  
  final List<Screenshot> screenshots;
  
  const ScreenshotSwiper({super.key, required this.screenshots});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.screenshots.length == 0) {
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
          itemCount: screenshots.length,
          layout: SwiperLayout.DEFAULT,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final Screenshot = screenshots[index];
            return GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(Screenshot.image),
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}