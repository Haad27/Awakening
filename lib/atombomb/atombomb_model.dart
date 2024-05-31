import '/flutter_flow/flutter_flow_util.dart';
import 'atombomb_widget.dart' show AtombombWidget;
import 'package:flutter/material.dart';

class AtombombModel extends FlutterFlowModel<AtombombWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  String? done = '';

  String? half = '';

  String? fail = '';

  bool no1 = true;

  bool no2 = true;

  bool no3 = true;

  bool no4 = true;

  bool no5 = true;

  bool no6 = true;

  bool no7 = true;

  bool no8 = true;

  bool no9 = true;

  String? anger;

  String? anger2;

  String? anger3;

  String? anxiety;

  String? anxiety2;

  String? anxiety3;

  String? sleep;

  String? sleep2;

  String? sleep3;

  String? stress;

  String? stress2;

  String? stress3;

  String? prayer;

  String? prayer2;

  String? prayer3;

  String? habit;

  String? habit2;

  String? habit3;

  String? rship;

  String? rship2;

  String? rship3;

  String? self;

  String? self2;

  String? self3;

  double? progressvalue;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
