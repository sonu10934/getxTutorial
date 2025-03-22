import 'package:getx_api_tutorial/Backend/Api_Services/base_api_services.dart';
import 'package:getx_api_tutorial/Backend/Exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future get({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      return getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post({required String url, required Map<String, dynamic> data}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
