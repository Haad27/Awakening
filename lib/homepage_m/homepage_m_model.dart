import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_m_widget.dart' show HomepageMWidget;
import 'package:flutter/material.dart';

class HomepageMModel extends FlutterFlowModel<HomepageMWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
