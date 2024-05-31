import '/flutter_flow/flutter_flow_util.dart';
import 'aim_widget.dart' show AimWidget;
import 'package:flutter/material.dart';

class AimModel extends FlutterFlowModel<AimWidget> {
  ///  State fields for stateful widgets in this component.

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
