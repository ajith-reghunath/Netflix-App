import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/homeWidgets/background_card.dart';
import 'package:netflix_app/presentation/widgets/card_with_number.dart';
import 'package:netflix_app/presentation/widgets/card_with_title.dart';
import 'package:tmdb_api/tmdb_api.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List trendingMovies = [];
  List top10Movies = [];
  List upcomingMovies = [];
  List popularMovies = [];
  final String apiKey = 'fbd18dd22d04fa8209b31c221cae4ddf';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYmQxOGRkMjJkMDRmYTgyMDliMzFjMjIxY2FlNGRkZiIsInN1YiI6IjY0NzE5YWQ3ODgxM2U0MDE0NTJjYmFlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A-XOV5Ke1VKYic5Ub130CgxgkQ_sw-oVAmEK5pa-l0o';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map top10Result = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcoming = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map popular = await tmdbWithCustomLogs.v3.movies.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      top10Movies = top10Result['results'];
      upcomingMovies = upcoming['results'];
      popularMovies = popular['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return (trendingMovies.isEmpty)
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
        : Scaffold(
            body: ValueListenableBuilder(
                valueListenable: scrollNotifier,
                builder: ((BuildContext context, value, child) {
                  return NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;
                      if (direction == ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      } else if (direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      }
                      return true;
                    },
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ListView(
                              children: [
                                BackgroundWidget(
                                  imagePath: 'https://image.tmdb.org/t/p/w500${trendingMovies[0]['poster_path']}',
                                ),
                                CardsWithTitle(
                                  title: 'Trending Now',
                                  listOfMovies: trendingMovies,
                                ),
                                CardsWithNumber(
                                  title: 'Top 10 TV Shows In India Today',
                                  listOfMovies: top10Movies,
                                ),
                                CardsWithTitle(
                                  title: 'Upcoming Movies',
                                  listOfMovies: upcomingMovies,
                                ),
                                CardsWithTitle(
                                  title: 'Popular Movies',
                                  listOfMovies: popularMovies,
                                )
                              ],
                            ),
                            scrollNotifier.value == true
                                ? const AppBarWithLogo()
                                : kheight
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}

class AppBarWithLogo extends StatelessWidget {
  const AppBarWithLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.black.withOpacity(0.7),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'lib/core/images/netflixlogo.png',
                width: 45,
                height: 45,
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
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              AppBarSection2(
                appBarOption: 'TV Shows',
              ),
              AppBarSection2(
                appBarOption: 'Movies',
              ),
              AppBarSection2(appBarOption: 'Categories')
            ],
          )
        ],
      ),
    );
  }
}

class AppBarSection2 extends StatelessWidget {
  final String appBarOption;
  const AppBarSection2({
    required this.appBarOption,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      appBarOption,
      style: TextStyle(
          color: kWhite, fontSize: textFontSize, fontWeight: FontWeight.bold),
    );
  }
}
