import 'package:get/get.dart';
import 'package:getx_api_tutorial/Backend/Response/app_response.dart';
import 'package:getx_api_tutorial/repositories/Movies_repo/movies_repository.dart';
import 'package:getx_api_tutorial/view_model/controllers/movies_controller/movies_controller.dart';

class MovieServices {
  MoviesController get _controller => Get.find<MoviesController>();
  final MoviesRepository _repo = MoviesRepository();

  getMovies() async {
    _controller.setMovies(AppResponse.loading());
    try {
      final response = await _repo.getMovies();
      _controller.setMovies(AppResponse.complete(response));
    } catch (e) {
      _controller.setMovies(AppResponse.error());
    }
  }
}
