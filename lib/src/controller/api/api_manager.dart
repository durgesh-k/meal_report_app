import 'package:canteen_meal_report/src/controller/api/api_interceptor.dart';
import 'package:canteen_meal_report/src/domain/utils/env_utils.dart';
import 'package:canteen_meal_report/src/domain/utils/logger_utils.dart';
import 'package:canteen_meal_report/src/domain/utils/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiManager {
  final Dio _apiClient = Dio();
  final String key = "";

  ApiManager() {
    if (kDebugMode) {
      _apiClient.interceptors.add(AppInterceptor().prettyDioLogger);
    }
  }

  initialiseOptions() async {
    String token = await SecureStorage.getStringFromSF("token");
    if (token.isNotEmpty) {
      _apiClient.options = BaseOptions(headers: {
        "Authorization": "Bearer $token",
        "accept": "application/json"
      });
    } else {
      token = await EnvUtils.getTokenFromENV();
      if (token.isNotEmpty) {
        _apiClient.options = BaseOptions(headers: {
          "Authorization": "Bearer $token",
          "accept": "application/json"
        });
        SecureStorage.addStringToSF("token", token);
      } else {
        Fluttertoast.showToast(msg: "Invalid Authentication");
        _apiClient.options =
            BaseOptions(headers: {"accept": "application/json"});
      }
    }
    LoggerUtils.showInfo("API HEADERS=>\n ${_apiClient.options.headers}");
  }

  Future<Response> request({
    required String url,
    required Options options,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    return await _apiClient.request(url,
        options: options,
        queryParameters: queryParameters ?? {},
        data: data ?? {});
  }
}

ApiManager apiManager = ApiManager();
