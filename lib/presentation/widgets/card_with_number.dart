import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/homeWidgets/tile_with_number.dart';
import 'package:netflix_app/presentation/widgets/title.dart';

class CardsWithNumber extends StatelessWidget {
  final String title;
  final List listOfMovies;
  const CardsWithNumber({
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
              itemBuilder: (context, index) => TileWithNumber(index: index,path: 'http://image.tmdb.org/t/p/w500${listOfMovies[index]['poster_path']}'),
              separatorBuilder: (context, index) => const SizedBox(width: 2),
              itemCount: 10),
        ),kheight20
      ],
    );
  }
}