import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'expenses_list_widget.dart' show ExpensesListWidget;
import 'package:flutter/material.dart';

class ExpensesListModel extends FlutterFlowModel<ExpensesListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBar component.
  late TopBarModel topBarModel;
  // Model for BottomBar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    bottomBarModel.dispose();
  }
}
