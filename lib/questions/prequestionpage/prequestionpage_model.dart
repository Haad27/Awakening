import '/flutter_flow/flutter_flow_util.dart';
import 'prequestionpage_widget.dart' show PrequestionpageWidget;
import 'package:flutter/material.dart';

class PrequestionpageModel extends FlutterFlowModel<PrequestionpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
