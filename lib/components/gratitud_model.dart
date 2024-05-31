import '/flutter_flow/flutter_flow_util.dart';
import 'gratitud_widget.dart' show GratitudWidget;
import 'package:flutter/material.dart';

class GratitudModel extends FlutterFlowModel<GratitudWidget> {
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
