import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'atombomb_model.dart';
export 'atombomb_model.dart';

class AtombombWidget extends StatefulWidget {
  const AtombombWidget({super.key});

  @override
  State<AtombombWidget> createState() => _AtombombWidgetState();
}

class _AtombombWidgetState extends State<AtombombWidget>
    with TickerProviderStateMixin {
  late AtombombModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AtombombModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedDate = getCurrentTimestamp;
      _model.no1 = false;
      _model.no2 = false;
      _model.no3 = false;
      _model.no4 = false;
      _model.no5 = false;
      _model.no6 = false;
      _model.no7 = false;
      _model.no8 = false;
      _model.no9 = false;
      setState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 40.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: const Color(0x00F30101),
          label: Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: CircularPercentIndicator(
                      percent: FFAppState().weeklyvlaue,
                      radius: 50.0,
                      lineWidth: 15.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: FFAppState().weeklyvlaue > 0.5
                          ? FlutterFlowTheme.of(context).success
                          : FlutterFlowTheme.of(context).primary,
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                      center: Text(
                        formatNumber(
                          FFAppState().weeklyvlaue,
                          formatType: FormatType.percent,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '54anzi0p' /* 50% Progress 
Required to pass */
                        ,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '6msd4vg9' /* Daily Review */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final currenweek = functions
                              .getWeekView(getCurrentTimestamp)
                              ?.toList() ??
                          [];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(currenweek.length,
                              (currenweekIndex) {
                            final currenweekItem = currenweek[currenweekIndex];
                            return Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FutureBuilder<int>(
                                  future: queryTasksRecordCount(
                                    queryBuilder: (tasksRecord) =>
                                        tasksRecord.where(
                                      'createdTime',
                                      isEqualTo: currenweekItem,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    int containerCount = snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectedDate = currenweekItem;
                                        setState(() {});
                                        if (_model.selectedDate ==
                                                currenweekItem
                                            ? true
                                            : true) {
                                          FFAppState().weeklyvlaue = 0.0;
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: 70.0,
                                        height: 86.0,
                                        decoration: BoxDecoration(
                                          color: dateTimeFormat(
                                                    'MEd',
                                                    currenweekItem,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ) ==
                                                  dateTimeFormat(
                                                    'MEd',
                                                    _model.selectedDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )
                                              ? (FFAppState().weeklyvlaue > 0.5
                                                  ? FlutterFlowTheme.of(context)
                                                      .success
                                                  : FlutterFlowTheme.of(context)
                                                      .primary)
                                              : const Color(0x00FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: dateTimeFormat(
                                                      'MEd',
                                                      _model.selectedDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ) ==
                                                    dateTimeFormat(
                                                      'MEd',
                                                      _model.selectedDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                ? (FFAppState().weeklyvlaue >
                                                        0.5
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .success
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primary)
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Opacity(
                                              opacity: 0.5,
                                              child: Text(
                                                dateTimeFormat(
                                                  'EE',
                                                  currenweekItem,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                'd',
                                                currenweekItem,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (containerCount >= 1)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 8.0,
                                                      height: 8.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                if (containerCount >= 2)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 8.0,
                                                      height: 8.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                if (containerCount >= 3)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 8.0,
                                                      height: 8.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                              ].divide(const SizedBox(width: 2.0)),
                                            ),
                                          ]
                                              .divide(const SizedBox(height: 10.0))
                                              .addToStart(
                                                  const SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 0.0, 8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '83g4pqn3' /* Daily Tasks */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'esd4xb29' /* Selecteddate */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                  'd',
                                  _model.selectedDate,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.7,
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  dateTimeFormat(
                                    'yMMMd',
                                    _model.selectedDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'at05nzvr' /* Tab To Select And Double Tab T... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().weeklyvlaue = 0.0;
                                  setState(() {});

                                  context.pushNamed('Atombomb');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'srswcc66' /* Press To Reset */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 12.0,
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
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 1300.0,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: SizedBox(
                                        height: 130.0,
                                        child: Stack(
                                          children: [
                                            if (_model.no1 == true)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 30.0,
                                                    fillColor:
                                                        const Color(0xD50BF301),
                                                    icon: Icon(
                                                      Icons.check,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 15.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                              ),
                                            if ((_model.done != 'done') &&
                                                (_model.half != 'half') &&
                                                (_model.fail != 'fail'))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 30.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 15.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color:
                                                      (_model.done != 'done') &&
                                                              (_model.half !=
                                                                  'half') &&
                                                              (_model.fail !=
                                                                  'fail')
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '52k01816' /* Depression */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/loneliness.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .done !=
                                                                          'done') &&
                                                                      (_model.half !=
                                                                          'half') &&
                                                                      (_model.fail !=
                                                                          'fail')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.done =
                                                                          'done';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                      _model.no1 =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.done =
                                                                          '';
                                                                      _model.no1 =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.done ==
                                                                                'done'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              'wqr3mrd2' /* DailyGoal */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.half =
                                                                          'half';
                                                                      setState(
                                                                          () {});
                                                                      _model.no1 =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().progressvalue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.half =
                                                                          '';
                                                                      _model.no1 =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().progressvalue >= 1.0
                                                                              ? FFAppState().progressvalue
                                                                              : -0.037037037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.half ==
                                                                                'half'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'pxux5dnc' /* Physical 
workout */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.fail =
                                                                          'fail';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.fail =
                                                                          '';
                                                                      setState(
                                                                          () {});
                                                                      _model.no1 =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.fail ==
                                                                                'fail'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'kpsu67jb' /* Reaching Out To A Friend */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.anger == '1') ||
                                              (_model.anger2 == '2') ||
                                              (_model.anger3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.anger != '1') &&
                                              (_model.anger2 != '2') &&
                                              (_model.anger3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (_model.anger !=
                                                              '1') &&
                                                          (_model.anger2 !=
                                                              '2') &&
                                                          (_model.anger3 != '3')
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '7g7jt4zi' /* Anger */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/angry.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .anger !=
                                                                          '1') &&
                                                                      (_model.anger2 !=
                                                                          '2') &&
                                                                      (_model.anger3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.anger3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.no2 =
                                                                          false;
                                                                      _model.anger3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.anger3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ukefpyl3' /* CoolOff */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.no2 =
                                                                          true;
                                                                      _model.anger2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.anger2 =
                                                                          null;
                                                                      _model.no2 =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.anger2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'trroumom' /* Use Of "1"
Statement */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.anger =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      _model.no2 =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.no2 =
                                                                          false;
                                                                      _model.anger =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.anger ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '51uvb36r' /* Quite Place */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.anxiety == '1') ||
                                              (_model.anxiety2 == '2') ||
                                              (_model.anxiety3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.anxiety != '1') &&
                                              (_model.anxiety2 != '2') &&
                                              (_model.anxiety3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (_model.anxiety !=
                                                              '1') &&
                                                          (_model.anxiety2 !=
                                                              '2') &&
                                                          (_model.anxiety3 !=
                                                              '3')
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '5oleg34y' /* Anxiety */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/anxiety_(1).png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .anxiety !=
                                                                          '1') &&
                                                                      (_model.anxiety2 !=
                                                                          '2') &&
                                                                      (_model.anxiety3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.anxiety3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.anxiety3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.anxiety3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              'sa2y7t24' /* Deep Breathing */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.anxiety2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.anxiety2 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.anxiety2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '2fo3a0lk' /* Guided 
Mindfullness 
 */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.anxiety =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.anxiety =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.anxiety ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'hkaql2g5' /* Reframe Negative
Thoughts */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.sleep == '1') ||
                                              (_model.sleep2 == '2') ||
                                              (_model.sleep3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.sleep != '1') &&
                                              (_model.sleep2 != '2') &&
                                              (_model.sleep3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (_model.sleep !=
                                                              '1') &&
                                                          (_model.sleep2 !=
                                                              '2') &&
                                                          (_model.sleep3 != '3')
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '28x02kke' /* Sleep */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/day.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .sleep !=
                                                                          '1') &&
                                                                      (_model.sleep2 !=
                                                                          '2') &&
                                                                      (_model.sleep3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.sleep3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.sleep3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.sleep3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              'vj7ovh5k' /* BedTime 
Routine */
                                                                              ,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.sleep2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.sleep2 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.sleep2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'bibvp6js' /* Confortable Sleep
Environment */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.sleep =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.sleep =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.sleep ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ldgsewyw' /* No Caffine */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.stress == '1') ||
                                              (_model.stress2 == '2') ||
                                              (_model.stress3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.stress != '1') &&
                                              (_model.stress2 != '2') &&
                                              (_model.stress3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color:
                                                      (_model.stress != '1') &&
                                                              (_model.stress2 !=
                                                                  '2') &&
                                                              (_model.stress3 !=
                                                                  '3')
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'syi0jwrm' /* Stress */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/anxiety.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .stress !=
                                                                          '1') &&
                                                                      (_model.stress2 !=
                                                                          '2') &&
                                                                      (_model.stress3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.stress3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.stress3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.stress3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              'zsa0laol' /* BodyScan 
Meditation */
                                                                              ,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.stress2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.sleep2 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.stress2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '153ebqkg' /* Identifying And
Journel */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.stress =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.stress =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.stress ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'k5sdu9mf' /* Relax And 
Recharge */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.prayer == '1') ||
                                              (_model.prayer2 == '2') ||
                                              (_model.prayer3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.prayer != '1') &&
                                              (_model.prayer2 != '2') &&
                                              (_model.prayer3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color:
                                                      (_model.prayer != '1') &&
                                                              (_model.prayer2 !=
                                                                  '2') &&
                                                              (_model.prayer3 !=
                                                                  '3')
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'rc5iwp21' /* Relationships */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/family.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .prayer !=
                                                                          '1') &&
                                                                      (_model.prayer2 !=
                                                                          '2') &&
                                                                      (_model.prayer3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.prayer3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.prayer3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.prayer3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              'rgizwlpw' /* Active Listenning */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.prayer2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.prayer2 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.prayer2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'han4iq0x' /* Dedicated Time
For Family */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.prayer =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.prayer =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.prayer ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'i6r5i38l' /* Helping In Chores */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.self == '1') ||
                                              (_model.self2 == '2') ||
                                              (_model.self3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.self != '1') &&
                                              (_model.self2 != '2') &&
                                              (_model.self3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (_model.self != '1') &&
                                                          (_model.self2 !=
                                                              '2') &&
                                                          (_model.self3 != '3')
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'p5ai6vbt' /* Self-Esteem */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/self-awareness.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .self !=
                                                                          '1') &&
                                                                      (_model.self2 !=
                                                                          '2') &&
                                                                      (_model.self3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.self3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.self3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.self3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0qidljyk' /* Leanning New
Skills */
                                                                              ,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.self2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.self2 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.self2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ch4r81o4' /* Positive
Affirmation */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.self =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.self =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.self ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '33m17v2p' /* Self Talk */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.rship == '1') ||
                                              (_model.rship2 == '2') ||
                                              (_model.rship3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.rship != '1') &&
                                              (_model.rship2 != '2') &&
                                              (_model.rship3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (_model.rship !=
                                                              '1') &&
                                                          (_model.rship2 !=
                                                              '2') &&
                                                          (_model.rship3 != '3')
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ke7cdm04' /* Prayers */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/gratitude.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .rship !=
                                                                          '1') &&
                                                                      (_model.rship2 !=
                                                                          '2') &&
                                                                      (_model.rship3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.rship3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.rship3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.rship3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              '412a1dij' /* Gratitude */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.rship2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.rship2 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.rship2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'x8zamfsj' /* 5 times
Prayers */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.rship =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.rship =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.rship ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '1bb5pygy' /* Quran Recitation */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130.0,
                                      child: Stack(
                                        children: [
                                          if ((_model.habit == '1') ||
                                              (_model.habit2 == '2') ||
                                              (_model.habit3 == '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor: const Color(0xD50BF301),
                                                  icon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((_model.habit != '1') &&
                                              (_model.habit2 != '2') &&
                                              (_model.habit3 != '3'))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (_model.habit !=
                                                              '1') &&
                                                          (_model.habit2 !=
                                                              '2') &&
                                                          (_model.habit3 != '3')
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : const Color(0xFF32CD32),
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'cn6edpbw' /* Habits */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/healthy-lifestyle.png',
                                                            width: 100.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: (_model
                                                                              .habit !=
                                                                          '1') &&
                                                                      (_model.habit2 !=
                                                                          '2') &&
                                                                      (_model.habit3 !=
                                                                          '3')
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : const Color(
                                                                      0xFF32CD32),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.habit3 =
                                                                          '3';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      _model.habit3 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.habit3 ==
                                                                                '3'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0lzhze51' /* New Habit */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.habit2 =
                                                                          '2';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.habit2 =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          103.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.habit2 ==
                                                                                '2'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'xoigj23i' /* Daily Quote */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.habit =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue >= .99
                                                                              ? 0.0
                                                                              : 0.037037037);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .weeklyvlaue = FFAppState()
                                                                              .weeklyvlaue +
                                                                          (FFAppState().weeklyvlaue > 0.0
                                                                              ? -0.037037037037037
                                                                              : FFAppState().weeklyvlaue);
                                                                      setState(
                                                                          () {});
                                                                      _model.habit =
                                                                          null;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.habit ==
                                                                                '1'
                                                                            ? const Color(0xC132CD32)
                                                                            : const Color(0x00000000),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'mmiqxebv' /* Motivational
Quote */
                                                                            ,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 5.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        'xx964ggm' /* Button */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: FFLocalizations.of(context).getText(
                      '560gmzoq' /* Button */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
                if (!isWeb)
                  FlutterFlowAdBanner(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    showsTestAd: false,
                    androidAdUnitID: 'ca-app-pub-3757688613153940/3814067325',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
