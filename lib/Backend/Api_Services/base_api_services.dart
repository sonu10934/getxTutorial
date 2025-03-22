abstract class BaseApiServices {
  Future<dynamic> get({required String url});
  Future<dynamic> post(
      {required String url, required Map<String, dynamic> data});
}
