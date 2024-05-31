import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notes1_widget.dart' show Notes1Widget;
import 'package:flutter/material.dart';

class Notes1Model extends FlutterFlowModel<Notes1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.

  Map<RecordRecord, bool> checkboxValueMap1 = {};
  List<RecordRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<RecordRecord, bool> checkboxValueMap2 = {};
  List<RecordRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<RecordRecord, bool> checkboxValueMap3 = {};
  List<RecordRecord> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
