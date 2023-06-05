import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ScreenDownload extends StatefulWidget {
  const ScreenDownload({super.key});

  @override
  State<ScreenDownload> createState() => _ScreenDownloadState();
}

class _ScreenDownloadState extends State<ScreenDownload> {
  final listView = [const SmartDownload(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            appBarTitle: 'Downloads',
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: ((context, index) => listView[index]),
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 50,
                )),
            itemCount: listView.length),
      ),
    );
  }
}

class SmartDownload extends StatelessWidget {
  const SmartDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kwidth,
        Text('Smart Downloads', style: TextStyle(fontWeight: FontWeight.bold))
      ],
    );
  }
}

class Section2 extends StatefulWidget {
  Section2({
    Key? key,
  }) : super(key: key);

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  List trendingMovies = [];
  final String apiKey = 'fbd18dd22d04fa8209b31c221cae4ddf';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYmQxOGRkMjJkMDRmYTgyMDliMzFjMjIxY2FlNGRkZiIsInN1YiI6IjY0NzE5YWQ3ODgxM2U0MDE0NTJjYmFlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A-XOV5Ke1VKYic5Ub130CgxgkQ_sw-oVAmEK5pa-l0o';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    setState(() {
      trendingMovies = trendingResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.center,
        ),
        kheight,
        Text(
            'We will download a personalised selection \nof movies and shows for you, so there is\nalways something to watch on your \ndevice.',
            style: TextStyle(
                color: kAsh,
                fontSize: textFontSize,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        SizedBox(
          width: size.width,
          height: size.width * 0.8,
          child: (trendingMovies.isEmpty)
        ? Scaffold(
            body: Center(
              child: Container(
                color: kBlack,
                width: 30,
                height: 30,
                child: const SizedBox(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          )
        :Center(
              child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.35,
                backgroundColor: const Color.fromARGB(255, 74, 74, 74),
              ),
              DownloadCard(
                moviePoster:
                    'https://image.tmdb.org/t/p/w500${trendingMovies[0]['poster_path']}',
                margin: const EdgeInsets.only(left: 160),
                angle: 20,
              ),
              DownloadCard(
                moviePoster:
                    'https://image.tmdb.org/t/p/w500${trendingMovies[1]['poster_path']}',
                margin: const EdgeInsets.only(right: 160),
                angle: -20,
              ),
              DownloadCard(
                moviePoster:
                    'https://image.tmdb.org/t/p/w500${trendingMovies[2]['poster_path']}',
                margin: const EdgeInsets.only(top: 20),
                width: 0.40,
                height: 0.60,
              ),
            ],
          )),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
                onPressed: () {},
                color: kButtonColorBlue,
                child: Text(
                  'Set Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                      fontSize: buttonTextFontSize),
                )),
          ),
          MaterialButton(
              onPressed: () {},
              color: kButtonColorWhite,
              child: Text(
                'See What You Can Download',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBlack,
                    fontSize: buttonTextFontSize),
              )),
        ],
      ),
    );
  }
}

class DownloadCard extends StatelessWidget {
  const DownloadCard(
      {Key? key,
      required this.moviePoster,
      this.angle = 0,
      this.width = 0.4,
      this.height = 0.5,
      required this.margin})
      : super(key: key);

  final String moviePoster;
  final double angle;
  final EdgeInsets margin;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * width,
        height: size.width * height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(moviePoster),
          ),
        ),
      ),
    );
  }
}
