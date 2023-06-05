import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class TitleSearch extends StatelessWidget {
  final String title;
  const TitleSearch({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontWeight: FontWeight.bold, color: kWhite, fontSize: 22),
    );
  }
}
