import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/homeWidgets/home_button.dart';

class BackgroundWidget extends StatelessWidget {
  final String imagePath;
  const BackgroundWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 60),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        imagePath),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const HomeButtonIcon(buttonIcon: Icons.add, label: 'My List'),
                _textbutton(),
                const HomeButtonIcon(
                    buttonIcon: Icons.info_outline, label: 'Info'),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextButton _textbutton() {
    return TextButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10)),
        backgroundColor: MaterialStateProperty.all(kWhite),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 35,
        color: kBlack,
      ),
      label: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          'Play',
          style: TextStyle(
              fontSize: buttonTextFontSize,
              fontWeight: FontWeight.bold,
              color: kBlack),
        ),
      ),
    );
  }
}
