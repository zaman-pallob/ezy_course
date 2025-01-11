import 'package:dio/dio.dart';
import 'package:ezy_course/network/connection_checker.dart';
import 'package:ezy_course/utils/toast_utils.dart';

import 'app_exceptions.dart';
import 'client.dart';

class RestService {
  static Future<Response?> post(
    String endPoint, {
    dynamic payload,
    bool hasToken = true,
    String? contentType,
    String? accept,
  }) async {
    try {
      if (await hasConnection()) {
        var response = await Client.dio.post(endPoint,
            data: payload,
            options: Options(
              headers: Client.headers(
                accept: accept,
                contentType: contentType,
                token: hasToken ? "" : null,
              ),
            ));
        return response;
      } else {
        errorToast(message: "No internet connection!!");
        return null;
      }
    } on DioException catch (e) {
      String message = AppExceptions.getMessage(e);
      if (message == "Error Type unknown") {
        errorToast(message: message);
        return e.response;
      } else {
        errorToast(message: message);
        return e.response;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<Response?> get(String endPoint,
      {bool hasToken = true, Map<String, dynamic>? queryParameters}) async {
    try {
      if (await hasConnection()) {
        var response = await Client.dio.get(endPoint,
            queryParameters: queryParameters,
            options: Options(
              headers: Client.headers(
                token: hasToken ? "" : null,
              ),
            ));
        return response;
      } else {
        errorToast(message: "No internet connection!!");
        return null;
      }
    } on DioException catch (e) {
      String message = AppExceptions.getMessage(e);
      if (message == "Error Type unknown") {
        errorToast(message: message);
        return e.response;
      } else {
        errorToast(message: message);
        return e.response;
      }
    }
  }
}
