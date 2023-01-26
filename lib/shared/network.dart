import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tmdb/shared/shared.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Network {
  // String basicAuth =
  //     base64.encode(utf8.encode('${Constants.apiKey}:${Constants.secretKey}'));

  final _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: 8000,
      receiveTimeout: 5000,
      headers: {
        // 'Content-Type': 'application/json',
        // 'Basic':
        //     'NmFhNjE2MGQtMjcyMC00MDgwLTg2NzMtNWRiYmQ0ODJkNGZlOjJjNjhtNjZiOWo5N2IyZmZwdHZ4ZWJqeTl2b3Y1ZjhsaGdrOTNnNWpoZ2txeDRpNTg1MjRvM2o3MTNjaXQzeHo='
      },
    ),
  );

  Network() {
    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 120),
    );
  }

  Future<dynamic> postHttp({
    required String? path,
    Map<String, dynamic>? parameter,
    required Map<String, dynamic>? content,
    required String? contentType,
  }) async {
    _dio.options.responseType = ResponseType.json;

    Map<String, dynamic> headers = {
      'content-type': contentType,
      'Accept': contentType,
    };

    // String sessionId = await storage.getString(
    //     boxName: describeEnum(StorageConstants.user), key: 'sessionId');
    // if (sessionId != '') {
    //   headers['_sessionId'] = sessionId;
    // }

    _dio.options.headers = headers;
    try {
      Response response;

      response =
          await _dio.post(path!, queryParameters: parameter, data: content);

      return response.data;
    } on DioError catch (e) {
      return (e.error);
    }
  }

  Future<dynamic> getHttp({
    required String? path,
    Map<String, dynamic>? parameter,
    required String? contentType,
  }) async {
    _dio.options.responseType = ResponseType.json;

    Map<String, dynamic> headers = {
      'content-type': contentType,
      'Accept': contentType,
    };

    String token = await storage.getString(
        boxName: describeEnum(StorageConstants.user), key: 'token');
    if (token != '') {
      headers['Authorization'] = 'Bearer $token';
    }

    _dio.options.headers = headers;
    try {
      Response response;

      response = await _dio.get(path!, queryParameters: parameter);

      return response.data;
    } on DioError catch (e) {
      return (e.error);
    }
  }

  Future<dynamic> deleteHttp({
    required String? path,
    // Map<String, dynamic>? parameter,
    required String? contentType,
    // required Map<String, dynamic>? content,
  }) async {
    _dio.options.responseType = ResponseType.json;

    Map<String, dynamic> headers = {
      'content-type': contentType,
      'Accept': contentType,
    };

    String sessionId = await storage.getString(
        boxName: describeEnum(StorageConstants.user), key: 'sessionId');
    if (sessionId != '') {
      headers['_sessionId'] = sessionId;
    }

    _dio.options.headers = headers;
    try {
      Response response;

      response = await _dio.delete(path!);

      return response.data;
    } on DioError catch (e) {
      return (e.error);
    }
  }
}

final network = Network();
