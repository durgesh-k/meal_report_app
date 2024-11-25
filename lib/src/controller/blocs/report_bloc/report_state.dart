part of 'report_bloc.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportFetchSuccessState extends ReportState {
  final ReportResponse response;
  final ReportSummary reportSummary;
  ReportFetchSuccessState(
      {required this.response, required this.reportSummary});
}

final class ReportFetchFailureState extends ReportState {
  final String message;

  ReportFetchFailureState({required this.message});
}

final class ReportFetchLoadingState extends ReportState {}
