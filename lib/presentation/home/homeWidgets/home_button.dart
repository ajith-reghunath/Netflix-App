import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class HomeButtonIcon extends StatelessWidget {
  final IconData buttonIcon;
  final String label;
  const HomeButtonIcon({
    required this.buttonIcon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          buttonIcon,
          color: kWhite,
          size: 30,
        ),
         Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}