import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trip_card_widget.dart' show TripCardWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TripCardModel extends FlutterFlowModel<TripCardWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for Addemail widget.
  FocusNode? addemailFocusNode;
  TextEditingController? addemailTextController;
  String? Function(BuildContext, String?)? addemailTextControllerValidator;
  String? _addemailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Deleteemail widget.
  FocusNode? deleteemailFocusNode;
  TextEditingController? deleteemailTextController;
  String? Function(BuildContext, String?)? deleteemailTextControllerValidator;
  // Model for BottomBar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    addemailTextControllerValidator = _addemailTextControllerValidator;
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    expandableExpandableController.dispose();
    addemailFocusNode?.dispose();
    addemailTextController?.dispose();

    deleteemailFocusNode?.dispose();
    deleteemailTextController?.dispose();

    bottomBarModel.dispose();
  }
}
