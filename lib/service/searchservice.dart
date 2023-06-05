import 'package:netflix_app/constants.dart';
import 'package:netflix_app/models/searchmodel.dart';
import 'package:http/http.dart' as http;

class SearchService {
  Future<MovieSearch?> getMovies(String searchterm) async {
    var url = Uri.parse(
        ApiConstant.searchbaseUrl + searchterm + ApiConstant.searchEndpoint);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return movieSearchFromJson(response.body);
    } else {
      return null;
    }
  }
}
