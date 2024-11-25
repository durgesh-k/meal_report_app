import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:canteen_meal_report/src/controller/repositories/report_repository.dart';
import 'package:canteen_meal_report/src/data/constants.dart';
import 'package:canteen_meal_report/src/data/enums/order_status.dart';
import 'package:canteen_meal_report/src/data/models/api/api_response_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_request_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_response_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_summary_model.dart';
import 'package:canteen_meal_report/src/domain/utils/logger_utils.dart';
import 'package:meta/meta.dart';

import '../../../data/models/report/report_data_model.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportEvent>((event, emit) {});
    on<ReportFetchEvent>(reportFetchEvent);
    on<GetMonthlyReportEvent>(getMonthlyReportEvent);
  }

  Map<String, ReportResponse?> monthlyReportsData = {};

  Future<FutureOr<void>> reportFetchEvent(
      ReportFetchEvent event, Emitter<ReportState> emit) async {
    try {
      emit(ReportFetchLoadingState());
      ApiResponse response =
          await ReportRepository().getUserReport(event.model);
      if (response.isSuccess) {
        ReportResponse reportResponse = response.model;
        ReportSummary reportSummary = calculateReportParams(reportResponse);
        emit(ReportFetchSuccessState(
            response: response.model, reportSummary: reportSummary));

        monthlyReportsData[Constants.months[event.model.month - 1]] =
            response.model;
      } else {
        emit(ReportFetchFailureState(
            message:
                response.message ?? "Something went wrong. Please try again"));
        LoggerUtils.showError(response.message ?? "");
      }
    } catch (e) {
      LoggerUtils.showError(e);
      emit(ReportFetchFailureState(
          message: "Something went wrong. Please try again"));
    }
  }

  FutureOr<void> getMonthlyReportEvent(
      GetMonthlyReportEvent event, Emitter<ReportState> emit) {
    if (monthlyReportsData.containsKey(event.month)) {
      ReportResponse reportResponse = monthlyReportsData[event.month]!;
      ReportSummary reportSummary = calculateReportParams(reportResponse);
      emit(ReportFetchSuccessState(
          response: reportResponse, reportSummary: reportSummary));
    } else {
      int monthInt = Constants.months.indexOf(event.month);
      ReportRequestModel request = ReportRequestModel(month: monthInt + 1);
      add(ReportFetchEvent(model: request));
    }
  }

  ReportSummary calculateReportParams(ReportResponse reportResponse) {
    ReportSummary reportSummary = ReportSummary.zero();
    for (OrderReport order in reportResponse.reports) {
      if (order.mealStatus != null) {
        addToReportParams(order.mealStatus!.breakfast, reportSummary);
        addToReportParams(order.mealStatus!.lunch, reportSummary);
        addToReportParams(order.mealStatus!.dinner, reportSummary);
        reportSummary.incrementOrdered();
      }
    }
    return reportSummary;
  }

  addToReportParams(OrderStatus key, ReportSummary reportSummary) {
    if (key == OrderStatus.delivered) {
      reportSummary.incrementDelivered();
    } else if (key == OrderStatus.canceled) {
      reportSummary.incrementCanceled();
    } else if (key == OrderStatus.pending) {
      reportSummary.incrementPending();
      reportSummary.incrementFine();
    }
  }
}
