import 'package:canteen_meal_report/src/controller/api/api_manager.dart';
import 'package:canteen_meal_report/src/controller/api/endpoints/report_endpoint.dart';
import 'package:canteen_meal_report/src/data/models/api/api_response_model.dart';
import 'package:canteen_meal_report/src/data/models/api/endpoint_model.dart';
import 'package:canteen_meal_report/src/data/models/api/error_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_request_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_response_model.dart';
import 'package:canteen_meal_report/src/domain/utils/logger_utils.dart';
import 'package:dio/dio.dart';

class ReportRepository {
  Future<ApiResponse> getUserReport(ReportRequestModel reportRequest) async {
    Endpoint endpoint = ReportEndpoints.report;
    try {
      final response = await apiManager.request(
          url: endpoint.url,
          options: Options(method: endpoint.method.value),
          data: reportRequest.toJson());

      if (response.statusCode == 200 && response.data != null) {
        return ApiResponse<dynamic>(
            statusCode: 200,
            model: ReportResponse.fromJson(response.data),
            message: "User Report fetched successfully",
            isSuccess: true);
      } else {
        String message =
            (response.data ?? "Something went wrong. Please try again")
                .toString();
        return ApiResponse<ErrorModel>(
            message: message,
            model: ErrorModel.fromJson(response.data ?? {}),
            statusCode: response.statusCode ?? 500);
      }
    } on DioException catch (e) {
      LoggerUtils.showError(e);
      String message = "Something went wrong. Please try again";
      return ApiResponse(
          statusCode: e.response?.statusCode ?? 500, message: message);
    }
  }
}
