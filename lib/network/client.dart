// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:ezy_course/network/app_urls.dart';
import 'package:logger/logger.dart';

class Client {
  static final Client _Client = Client._internal();
  static late Dio dio;
  factory Client() {
    initializeDio();

    return _Client;
  }
  Client._internal();

  static Future initializeDio() async {
    dio = Dio();

    dio.options.baseUrl = AppUrls.baseUrl;
    dio.options.sendTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.responseType = ResponseType.json;
    dio.options.followRedirects = true;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        /*  var map = {
          "Category": "New Request",
          "Method": options.method,
          "Url": (options.uri.origin) + (options.uri.path),
          "Headers": options.headers,
          "query params": options.queryParameters,
          "body data": options.data,
        };

         logger.d(map);*/
        handler.next(options);
      },
      onResponse: (response, handler) {
        //logger.i(response);
        handler.next(response);
      },
      onError: (err, handler) async {
        var map = {
          "Category": "Error",
          "Method": err.response?.requestOptions.method,
          "Url": (err.response?.requestOptions.uri.origin ?? "") +
              (err.response?.requestOptions.uri.path ?? ""),
          "Headers": err.response?.requestOptions.headers,
          "query params": err.response?.requestOptions.queryParameters,
          "body data": err.response?.requestOptions.data,
          "ErrorStatusCode": err.response?.statusCode,
          "Error": err
        };

        logger.e(map);
        if (err.response?.statusCode == 401) {
        } else {
          handler.next(err);
        }
      },
    ));
  }

  static Map<String, dynamic> headers({
    String? token,
    String? contentType,
    String? accept,
  }) {
    var httpHeaders = {
      "Accept": accept ?? "application/json",
      "Content-Type": contentType ?? "application/json",
    };
    if (token != null) {
      httpHeaders = {...httpHeaders, "Authorization": "Bearer $token"};
    }

    return httpHeaders;
  }
}

final logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  dateTimeFormat: DateTimeFormat.dateAndTime,
));
