import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/presentation/fastLaugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});

  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) => VideoListItem(index: index)),))
    );
  }
}
