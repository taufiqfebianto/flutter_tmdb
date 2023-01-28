import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../shared/shared.dart';

class UserRepo {
  Future<RequestTokenResponseModel> getToken() async {
    try {
      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
      };

      Map<String, dynamic> response = await network.getHttp(
          path: Constants.reqToken,
          parameter: parameters,
          contentType: 'application/json');

      return RequestTokenResponseModel.fromJson(response);
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  Future<bool> validateToken() async {
    try {
      String token = await storage.getString(
          boxName: describeEnum(StorageConstants.user), key: 'token');

      final Map<String, dynamic> content = {
        'username': Constants.username,
        'password': Constants.password,
        'request_token': token
      };

      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
      };

      await network.postHttp(
          path: Constants.validateToken,
          parameter: parameters,
          content: content,
          contentType: 'application/json');

      return true;
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  Future<ValidateTokenResponseModel> getSession(String token) async {
    try {
      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
      };

      final Map<String, dynamic> content = {'request_token': token};

      Map<String, dynamic> response = await network.postHttp(
          path: Constants.createSession,
          parameter: parameters,
          content: content,
          contentType: 'application/json');

      return ValidateTokenResponseModel.fromJson(response);
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
