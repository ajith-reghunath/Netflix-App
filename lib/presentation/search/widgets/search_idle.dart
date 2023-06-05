import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/searchmodel.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

class SearchIdleWidget extends StatefulWidget {
  SearchIdleWidget({super.key, required this.videos});
  List<Result> videos;

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  bool isLoaded = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    if (widget.videos.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: Container(
        height: 100,
        child: const Center(
          child: Text(
            'No data available',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 253, 253, 253)),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleSearch(title: 'Top Searches'),
          kheight,
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) => SearchIdleTile(
                    title: widget.videos[index].title,
                    imageUrl: widget.videos[index].posterPath)),
                separatorBuilder: ((context, index) => kheight20),
                itemCount: widget.videos.length),
          ),
        ],
      ),
    );
  }
}

class SearchIdleTile extends StatelessWidget {
  String ? imageUrl;
  String title;
  SearchIdleTile({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: 0.35 * screenWidth,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage('https://image.tmdb.org/t/p/original$imageUrl'))),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          Icons.play_circle_outline_outlined,
          color: kWhite,
          size: 40,
        ),
      ],
    );
  }
}
