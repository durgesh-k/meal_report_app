import 'package:canteen_meal_report/src/controller/api/base_endpoints.dart';
import 'package:canteen_meal_report/src/data/enums/http_method.dart';
import 'package:canteen_meal_report/src/data/models/api/endpoint_model.dart';

abstract class ReportEndpoints {
  static const _base = BaseEndpoints.customer;
  static final report =
      Endpoint(method: HttpMethod.post, base: _base, segment: "report");
}
