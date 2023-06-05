import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/searchmodel.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';
import 'package:netflix_app/service/searchservice.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  bool isLoaded = false;
  TextEditingController controller = TextEditingController();
  late List<Result>? searchResults = [];
  String searchTerm = '';

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    MovieSearch result = (await SearchService().getMovies(searchTerm))!;
    searchResults = result.results;
    if (searchResults !=null) {
      setState(() {
        isLoaded = true;
      });
      print(isLoaded);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  onFieldSubmitted: (String value) {
                    setState(() {
                      searchTerm = value;
                      _getData();
                      isLoaded = false;
                      // controller.clear();
                    });
                  },
                  controller: controller,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 231, 231, 231),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                      hintText: 'Search Movie',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 190, 190, 190),
                          fontWeight: FontWeight.normal),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      border: InputBorder.none),
                ),
              ),
              kheight,
              Visibility(
                visible: isLoaded,
                replacement: Container(
                  height: 100,
                  child: const Center(
                    child: Text(
                      'No data available',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 253, 253, 253)),
                    ),
                  ),
                ),
                child: Expanded(
                  child: SearchIdleWidget(videos: searchResults!),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void dispose() {
    controller;
    super.dispose();
  }
}
