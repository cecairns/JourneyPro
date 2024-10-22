import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for sign-upEmail widget.
  FocusNode? signUpEmailFocusNode;
  TextEditingController? signUpEmailTextController;
  String? Function(BuildContext, String?)? signUpEmailTextControllerValidator;
  String? _signUpEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for SignupPass widget.
  FocusNode? signupPassFocusNode;
  TextEditingController? signupPassTextController;
  late bool signupPassVisibility;
  String? Function(BuildContext, String?)? signupPassTextControllerValidator;
  String? _signupPassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Not a Valid Password';
    }

    if (val.length < 6) {
      return 'Please increase password length to 6';
    }
    if (val.length > 20) {
      return 'Please decrease password length to under 20';
    }

    return null;
  }

  // State field(s) for ConfirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassTextController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassTextControllerValidator;
  String? _confirmPassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for loginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  // State field(s) for loginPass widget.
  FocusNode? loginPassFocusNode;
  TextEditingController? loginPassTextController;
  late bool loginPassVisibility;
  String? Function(BuildContext, String?)? loginPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signUpEmailTextControllerValidator = _signUpEmailTextControllerValidator;
    signupPassVisibility = false;
    signupPassTextControllerValidator = _signupPassTextControllerValidator;
    confirmPassVisibility = false;
    confirmPassTextControllerValidator = _confirmPassTextControllerValidator;
    loginPassVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    signUpEmailFocusNode?.dispose();
    signUpEmailTextController?.dispose();

    signupPassFocusNode?.dispose();
    signupPassTextController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassTextController?.dispose();

    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();

    loginPassFocusNode?.dispose();
    loginPassTextController?.dispose();
  }
}
