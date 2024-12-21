import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_trip_widget.dart' show AddTripWidget;
import 'package:flutter/material.dart';

class AddTripModel extends FlutterFlowModel<AddTripWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for descrip widget.
  FocusNode? descripFocusNode;
  TextEditingController? descripTextController;
  String? Function(BuildContext, String?)? descripTextControllerValidator;
  // State field(s) for Addemail widget.
  FocusNode? addemailFocusNode;
  TextEditingController? addemailTextController;
  String? Function(BuildContext, String?)? addemailTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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

    addemailFocusNode?.dispose();
    addemailTextController?.dispose();

    bottomBarModel.dispose();
  }
}
