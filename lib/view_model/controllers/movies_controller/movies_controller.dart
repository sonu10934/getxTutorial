import 'package:get/get.dart';
import 'package:getx_api_tutorial/Backend/Response/app_response.dart';
import 'package:getx_api_tutorial/view_model/models/movie_model.dart';

class MoviesController extends GetxController {
  AppResponse<List<MovieModel>> _movies = AppResponse.pending();
  AppResponse<List<MovieModel>> get movies => _movies;

  setMovies(AppResponse<List<MovieModel>> response) {
    _movies = response;
    update();
  }
}
