import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class AppExceptiosn {
  final String prefix;
  final String message;

  AppExceptiosn({this.prefix = "", this.message = ""});

  @override
  String toString() => '$prefix $message';
}

class UnAuthorizedException extends AppExceptiosn {
  UnAuthorizedException({super.message})
      : super(prefix: "UnAuthorized Request");
}

class InternetException extends AppExceptiosn {
  InternetException({super.message}) : super(prefix: "Server Exception");
}

class DefaultException extends AppExceptiosn {
  DefaultException({super.message}) : super(prefix: "Something Went Wrong");
}

getResponse(http.Response response) {
  switch (response.statusCode) {
    case 200 || 201:
      return response.body.startsWith("{")
          ? jsonDecode(response.body)
          : response.body;
    case 500:
      throw InternetException();
    case 404:
      throw UnAuthorizedException();
    default:
      throw DefaultException();
  }
}
