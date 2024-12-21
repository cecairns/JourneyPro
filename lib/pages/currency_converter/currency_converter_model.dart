import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'currency_converter_widget.dart' show CurrencyConverterWidget;
import 'package:flutter/material.dart';

class CurrencyConverterModel extends FlutterFlowModel<CurrencyConverterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for CurConvFromText widget.
  String? curConvFromTextValue;
  FormFieldController<String>? curConvFromTextValueController;
  // State field(s) for CurConvToText widget.
  String? curConvToTextValue;
  FormFieldController<String>? curConvToTextValueController;
  // State field(s) for CurConvInputText widget.
  FocusNode? curConvInputTextFocusNode;
  TextEditingController? curConvInputTextTextController;
  String? Function(BuildContext, String?)?
      curConvInputTextTextControllerValidator;
  // Stores action output result for [Custom Action - currConverter] action in Button widget.
  double? output;
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
    curConvInputTextFocusNode?.dispose();
    curConvInputTextTextController?.dispose();

    bottomBarModel.dispose();
  }
}
