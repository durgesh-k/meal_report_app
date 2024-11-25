import 'package:canteen_meal_report/gen/colors.gen.dart';
import 'package:canteen_meal_report/src/controller/blocs/report_bloc/report_bloc.dart';
import 'package:canteen_meal_report/src/data/constants.dart';
import 'package:canteen_meal_report/src/data/models/report/report_request_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_response_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_summary_model.dart';
import 'package:canteen_meal_report/src/data/models/user/user_model.dart';
import 'package:canteen_meal_report/src/domain/utils/size_config.dart';
import 'package:canteen_meal_report/src/presentation/screens/home/widgets/report_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  ReportBloc reportBloc = ReportBloc();
  ReportResponse? reportResponse;
  ReportSummary? reportSummary;
  bool loading = true;
  bool error = false;
  UserModel? user;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 12, vsync: this);
    tabController.addListener(() {
      int currIndex = tabController.index;
      reportBloc.add(GetMonthlyReportEvent(month: Constants.months[currIndex]));
    });
    reportBloc.add(ReportFetchEvent(model: ReportRequestModel(month: 1)));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.initialize(context);
    return BlocConsumer<ReportBloc, ReportState>(
      bloc: reportBloc,
      listener: (context, state) {
        blocStateListener(state);
      },
      builder: (context, state) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100), child: appBar()),
            body: tabBarView());
      },
    );
  }

  blocStateListener(ReportState state) {
    if (state is ReportFetchLoadingState) {
      setState(() {
        loading = true;
      });
    } else if (state is ReportFetchSuccessState) {
      setState(() {
        loading = false;
        reportResponse = state.response;
        reportSummary = state.reportSummary;
        user = reportResponse!.user;
      });
    } else if (state is ReportFetchFailureState) {
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  tabBarView() => TabBarView(
        controller: tabController,
        children: Constants.months.map((month) {
          if (tabController.index == Constants.months.indexOf(month)) {
            if (loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (error) {
              return const Center(
                child: Text(
                  "Error",
                  style: TextStyle(color: ColorName.error),
                ),
              );
            } else {
              return reportResponse!.reports.isEmpty
                  ? Center(
                      child: Text(
                        "No reports for $month",
                        style: const TextStyle(fontSize: 18),
                      ),
                    )
                  : ReportListWidget(
                      reports: reportResponse!.reports,
                      showReport: true,
                      summary: reportSummary);
            }
          } else if (reportBloc.monthlyReportsData[month] != null) {
            return reportBloc.monthlyReportsData[month]!.reports.isEmpty
                ? Center(
                    child: Text(
                      "No reports for $month",
                      style: const TextStyle(fontSize: 18),
                    ),
                  )
                : ReportListWidget(
                    reports: reportBloc.monthlyReportsData[month]!.reports,
                    showReport: false);
          } else {
            return const SizedBox();
          }
        }).toList(),
      );

  appBar() => AppBar(
        title: user != null
            ? Text(
                'Hello, ${user!.firstName} ${user!.lastName}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            : const SizedBox(),
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: Constants.months
              .map((month) => Tab(
                    child: Text(month),
                  ))
              .toList(),
        ),
      );
}
