import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_trip_widget.dart' show EditTripWidget;
import 'package:flutter/material.dart';

class EditTripModel extends FlutterFlowModel<EditTripWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TopBar component.
  late TopBarModel topBarModel;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for descrip widget.
  FocusNode? descripFocusNode;
  TextEditingController? descripTextController;
  String? Function(BuildContext, String?)? descripTextControllerValidator;
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
    descripFocusNode?.dispose();
    descripTextController?.dispose();

    bottomBarModel.dispose();
  }
}
