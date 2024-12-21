import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_activity_widget.dart' show EditActivityWidget;
import 'package:flutter/material.dart';

class EditActivityModel extends FlutterFlowModel<EditActivityWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomBarModel.dispose();
  }
}
