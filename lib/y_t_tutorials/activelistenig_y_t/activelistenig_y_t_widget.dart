import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'activelistenig_y_t_model.dart';
export 'activelistenig_y_t_model.dart';

class ActivelistenigYTWidget extends StatefulWidget {
  const ActivelistenigYTWidget({super.key});

  @override
  State<ActivelistenigYTWidget> createState() => _ActivelistenigYTWidgetState();
}

class _ActivelistenigYTWidgetState extends State<ActivelistenigYTWidget> {
  late ActivelistenigYTModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivelistenigYTModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Color(0xA3F30101)],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              '7ocqtiq3' /* Active Listening  */,
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 26.0,
                  letterSpacing: 0.0,
                ),
          ),
          const FlutterFlowYoutubePlayer(
            url: 'https://youtu.be/rzsVh8YwZEQ?si=dAzA8l1T_qCokqoO',
            autoPlay: false,
            looping: true,
            mute: false,
            showControls: true,
            showFullScreen: true,
            strictRelatedVideos: false,
          ),
          FFButtonWidget(
            onPressed: () async {
              Navigator.pop(context);
            },
            text: FFLocalizations.of(context).getText(
              '5pmyind6' /* Done */,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(const SizedBox(height: 60.0)),
      ),
    );
  }
}
