import 'package:flutter/material.dart';

import '../../../core/constants.dart';


class Tile extends StatelessWidget {
  final String path;
  const Tile({
    required this.path,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(path), fit: BoxFit.cover),
        borderRadius: borderRadius,
      ),
      width: width * 0.35,
      height: 200,
    );
  }
}
