import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class WidgetTitle extends StatelessWidget {
  final String title;
  const WidgetTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          const TextStyle(fontWeight: FontWeight.bold, color: kWhite, fontSize: 22),
    );
  }
}