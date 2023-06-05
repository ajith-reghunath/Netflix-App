import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.appBarTitle});
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kwidth,
          Text(
            appBarTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 25,
          ),
          kwidth,
          Container(
            color: Colors.blue,
            height: 20,
            width: 20,
          ),
          kwidth
        ],
      ),
    );
  }
}
