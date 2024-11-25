class ApiResponse<T> {
  final T? model;
  final int statusCode;
  final String? message;
  final bool isSuccess;

  ApiResponse(
      {this.model,
      required this.statusCode,
      this.message,
      this.isSuccess = false});
}
