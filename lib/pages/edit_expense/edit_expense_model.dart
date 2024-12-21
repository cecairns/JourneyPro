import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_expense_widget.dart' show EditExpenseWidget;
import 'package:flutter/material.dart';

class EditExpenseModel extends FlutterFlowModel<EditExpenseWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descTextController;
  String? Function(BuildContext, String?)? descTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Cost widget.
  FocusNode? costFocusNode;
  TextEditingController? costTextController;
  String? Function(BuildContext, String?)? costTextControllerValidator;
  // State field(s) for CurConvFromText widget.
  String? curConvFromTextValue;
  FormFieldController<String>? curConvFromTextValueController;
  // State field(s) for CurConvToText widget.
  String? curConvToTextValue;
  FormFieldController<String>? curConvToTextValueController;
  // Stores action output result for [Custom Action - currConverter] action in conversion widget.
  double? output;
  // State field(s) for Debt widget.
  FocusNode? debtFocusNode;
  TextEditingController? debtTextController;
  String? Function(BuildContext, String?)? debtTextControllerValidator;
  // State field(s) for UserList widget.
  String? userListValue;
  FormFieldController<String>? userListValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descFocusNode?.dispose();
    descTextController?.dispose();

    costFocusNode?.dispose();
    costTextController?.dispose();

    debtFocusNode?.dispose();
    debtTextController?.dispose();

    bottomBarModel.dispose();
  }
}
