import '/flutter_flow/flutter_flow_util.dart';
import 'n_p_s_survey_widget.dart' show NPSSurveyWidget;
import 'package:flutter/material.dart';

class NPSSurveyModel extends FlutterFlowModel<NPSSurveyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
