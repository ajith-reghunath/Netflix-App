import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/title.dart';

import '../../core/constants.dart';
import '../home/homeWidgets/tile.dart';

class CardsWithTitle extends StatelessWidget {
  final List listOfMovies;
  final String title;
  const CardsWithTitle({
    required this.listOfMovies,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Tile(
                      path:
                          'http://image.tmdb.org/t/p/w500${listOfMovies[index]['poster_path']}',
                    ),
              separatorBuilder: (context, index) => kwidth,
              itemCount: 10),
        ),
        kheight20
      ],
    );
  }
}
