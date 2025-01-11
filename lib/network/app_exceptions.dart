import 'package:dio/dio.dart';

class AppExceptions {
  static String getMessage(DioException e) {
    if (e.type == DioExceptionType.unknown) {
      return "Error Type unknown";
    } else if (e.type == DioExceptionType.cancel) {
      return "Error Type cancel";
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return "Error Type timedOut";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Error Type received timeout";
    } else if (e.type == DioExceptionType.sendTimeout) {
      return "Error Type send time out";
    } else if (e.type == DioExceptionType.badResponse) {
      if (e.response?.statusCode == 404) {
        String url = (e.response?.requestOptions.uri.origin ?? "") +
            (e.response?.requestOptions.uri.path ?? "");
        return "$url doesn't exist";
      } else if (e.response!.statusCode! >= 500 &&
          e.response!.statusCode! <= 504) {
        return "Server error code-${e.response!.statusCode}";
      } else {
        return e.response?.data["msg"];
      }
    } else if (e.type == DioExceptionType.unknown) {
      return "Unkonwn exception";
    } else if (e.type == DioExceptionType.connectionError) {
      return "No internet connection!!!";
    } else {
      return e.toString();
    }
  }
}
