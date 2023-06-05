import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';
const imageurl =
      'https://www.themoviedb.org/t/p/w220_and_h330_face/iJv2ROkp55GxiCx9AFECZ2Cj2RJ.jpg';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSearch(title: 'TV & Show'),
        kheight,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1/1.6,
            shrinkWrap: true,
            children: List.generate(20, (index) => MainCard()),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageurl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(6)),
    );
  }
}
