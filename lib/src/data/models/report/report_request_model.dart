class ReportRequestModel {
  final int month;

  ReportRequestModel({required this.month});

  Map<String, dynamic> toJson() {
    return {
      'month': month,
    };
  }
}
