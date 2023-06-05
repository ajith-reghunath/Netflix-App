import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:stroke_text/stroke_text.dart';

class TileWithNumber extends StatelessWidget {
  final String path;
  final int index;
  const TileWithNumber({
    required this.path,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(width: 30),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(path), fit: BoxFit.cover),
                borderRadius: borderRadius,
              ),
              width: width * 0.35,
              height: 200,
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -20,
          child: StrokeText(
            text: '${index + 1}',
            textStyle: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 90,
                color: kBlack,
                fontFamily: 'League Spartan'),
            strokeColor: kAsh,
            strokeWidth: 5,
          ),
        ),
      ],
    );
  }
}
