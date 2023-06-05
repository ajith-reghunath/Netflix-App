import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.volume_off_outlined,
                        color: kBlack,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    RightIcon(icon: Icons.emoji_emotions, text: 'LOL'),
                    kheight20,
                    RightIcon(icon: Icons.add, text: 'My List'),
                    kheight20,
                    RightIcon(icon: Icons.share, text: 'Share'),
                    kheight20,
                    RightIcon(icon: Icons.play_arrow, text: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RightIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const RightIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Icon(icon,color: kWhite,size: 30,),Text(text,style: const TextStyle(fontWeight: FontWeight.bold),)],
    );
  }
}
