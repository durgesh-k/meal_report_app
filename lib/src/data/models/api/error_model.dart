class ErrorModel {
  final String error;
  final String message;
  final String status;
  final int statusCode;

  ErrorModel({
    required this.error,
    required this.message,
    required this.status,
    required this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      error: json['error'],
      message: json['message'],
      status: json['status'],
      statusCode: json['status_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'status': status,
      'status_code': statusCode,
    };
  }
}
