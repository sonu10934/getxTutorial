import 'package:getx_api_tutorial/Backend/Api_Services/base_api_services.dart';
import 'package:getx_api_tutorial/Backend/Api_Services/network_api_services.dart';
import 'package:getx_api_tutorial/res/Apis/apis.dart';
import 'package:getx_api_tutorial/view_model/models/movie_model.dart';

class MoviesRepository {
  final BaseApiServices _services = NetworkApiServices();

  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await _services.get(url: Apis.moviesApi);
      return (response['tv_shows'] as List)
          .map((e) => MovieModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
