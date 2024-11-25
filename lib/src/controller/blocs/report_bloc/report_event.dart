part of 'report_bloc.dart';

@immutable
sealed class ReportEvent {}

class ReportFetchEvent extends ReportEvent {
  final ReportRequestModel model;

  ReportFetchEvent({required this.model});
}

class GetMonthlyReportEvent extends ReportEvent {
  final String month;

  GetMonthlyReportEvent({required this.month});
}
