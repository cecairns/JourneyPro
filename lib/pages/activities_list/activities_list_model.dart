import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activities_list_widget.dart' show ActivitiesListWidget;
import 'package:flutter/material.dart';

class ActivitiesListModel extends FlutterFlowModel<ActivitiesListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for BottomBar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    bottomBarModel.dispose();
  }
}
