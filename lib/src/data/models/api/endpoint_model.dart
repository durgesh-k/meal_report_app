import 'package:canteen_meal_report/src/data/enums/http_method.dart';

class Endpoint {
  final HttpMethod method;
  final String base;
  final String? segment;

  String get url => "$base${segment != null ? "$segment" : ""}";

  Endpoint({this.method = HttpMethod.get, required this.base, this.segment});
}
