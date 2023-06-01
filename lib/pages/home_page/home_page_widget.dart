import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().diasgraficar = _model.countControllerValue!;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      },
                      text: 'Mostrar',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: FlutterFlowCountController(
                        decrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.minus,
                          color: enabled
                              ? FlutterFlowTheme.of(context).secondaryText
                              : FlutterFlowTheme.of(context).alternate,
                          size: 20.0,
                        ),
                        incrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.plus,
                          color: enabled
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                          size: 20.0,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        count: _model.countControllerValue ??= 1,
                        updateCount: (count) async {
                          setState(() => _model.countControllerValue = count);
                          FFAppState().diasgraficar =
                              _model.countControllerValue!;
                        },
                        stepSize: 1,
                      ),
                    ),
                  ],
                ),
                FutureBuilder<ApiCallResponse>(
                  future: (_model.apiRequestCompleter ??=
                          Completer<ApiCallResponse>()
                            ..complete(RegistrosSensoresGroup
                                .avgFromPlantAgroupByIntervalsToGraphCall
                                .call(
                              np: 'Mi tomatera',
                              d: FFAppState().diasgraficar,
                            )))
                      .future,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    final columnAvgFromPlantAgroupByIntervalsToGraphResponse =
                        snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 507.0,
                          height: 108.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final listaRegistros = getJsonField(
                                columnAvgFromPlantAgroupByIntervalsToGraphResponse
                                    .jsonBody,
                                r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                              ).toList().take(200).toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listaRegistros.length,
                                itemBuilder: (context, listaRegistrosIndex) {
                                  final listaRegistrosItem =
                                      listaRegistros[listaRegistrosIndex];
                                  return Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            listaRegistrosItem.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 507.0,
                          height: 108.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final listaRegistros = getJsonField(
                                columnAvgFromPlantAgroupByIntervalsToGraphResponse
                                    .jsonBody,
                                r'''$.TEMPERATURA.AMBIENTE.lista_valores''',
                              ).toList().take(200).toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listaRegistros.length,
                                itemBuilder: (context, listaRegistrosIndex) {
                                  final listaRegistrosItem =
                                      listaRegistros[listaRegistrosIndex];
                                  return Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            listaRegistrosItem.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 370.0,
                              height: 230.0,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: getJsonField(
                                      columnAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      columnAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores''',
                                    ),
                                    settings: LineChartBarData(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      barWidth: 2.0,
                                      isCurved: true,
                                      dotData: FlDotData(show: false),
                                    ),
                                  )
                                ],
                                chartStylingInfo: ChartStylingInfo(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  showBorder: false,
                                ),
                                axisBounds: AxisBounds(
                                  minY: -5.0,
                                  maxY: 45.0,
                                ),
                                xAxisLabelInfo: AxisLabelInfo(),
                                yAxisLabelInfo: AxisLabelInfo(
                                  showLabels: true,
                                  labelInterval: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<ApiCallResponse>(
                      future: RegistrosSensoresGroup
                          .avgFromPlantAgroupByIntervalsToGraphCall
                          .call(
                        np: 'Mi tomatera',
                        d: 1,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        final rowAvgFromPlantAgroupByIntervalsToGraphResponse =
                            snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 369.0,
                              height: 280.0,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: getJsonField(
                                      rowAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      rowAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores_maximos''',
                                    ),
                                    settings: LineChartBarData(
                                      color: Color(0xFFCB282B),
                                      barWidth: 2.0,
                                      isCurved: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: Color(0x4B2DA425),
                                      ),
                                    ),
                                  ),
                                  FFLineChartData(
                                    xData: getJsonField(
                                      rowAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      rowAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores_minimos''',
                                    ),
                                    settings: LineChartBarData(
                                      color: Color(0xFF3125A4),
                                      barWidth: 2.0,
                                      isCurved: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: Color(0x4C396BEF),
                                      ),
                                    ),
                                  ),
                                  FFLineChartData(
                                    xData: getJsonField(
                                      rowAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      rowAvgFromPlantAgroupByIntervalsToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores''',
                                    ),
                                    settings: LineChartBarData(
                                      color: Color(0xFF9D25A4),
                                      barWidth: 2.0,
                                      isCurved: true,
                                    ),
                                  )
                                ],
                                chartStylingInfo: ChartStylingInfo(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  showBorder: false,
                                ),
                                axisBounds: AxisBounds(
                                  minY: -5.0,
                                  maxY: 45.0,
                                ),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Fecha',
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: getJsonField(
                                    rowAvgFromPlantAgroupByIntervalsToGraphResponse
                                        .jsonBody,
                                    r'''$.TEMPERATURA.AMBIENTE.unidad_medida.nombre''',
                                  ).toString(),
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  showLabels: true,
                                  labelTextStyle: TextStyle(),
                                  labelInterval: 10.0,
                                  labelFormatter: LabelFormatter(
                                    numberFormat: (val) => formatNumber(
                                      val,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                FutureBuilder<ApiCallResponse>(
                  future: RegistrosSensoresGroup
                      .registrosSensoresAllFromPlantBetweenDatesToGraphCall
                      .call(
                    np: 'Mi tomatera',
                    fi: '2023-05-31 21:00:00',
                    ff: '2023-05-31 23:00:00',
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    final rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse =
                        snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 370.0,
                              height: 230.0,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores''',
                                    ),
                                    settings: LineChartBarData(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      barWidth: 2.0,
                                      isCurved: true,
                                    ),
                                  ),
                                  FFLineChartData(
                                    xData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores_maximos''',
                                    ),
                                    settings: LineChartBarData(
                                      color: Color(0x00000000),
                                      barWidth: 2.0,
                                      isCurved: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: Color(0x4C63EF39),
                                      ),
                                    ),
                                  ),
                                  FFLineChartData(
                                    xData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores_minimos''',
                                    ),
                                    settings: LineChartBarData(
                                      color: Color(0xFF2536A4),
                                      barWidth: 2.0,
                                      isCurved: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                    ),
                                  )
                                ],
                                chartStylingInfo: ChartStylingInfo(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  showBorder: false,
                                ),
                                axisBounds: AxisBounds(
                                  minY: -5.0,
                                  maxY: 45.0,
                                ),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Fecha',
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: getJsonField(
                                    rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                        .jsonBody,
                                    r'''$.TEMPERATURA.AMBIENTE.unidad_medida''',
                                  ).toString(),
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  showLabels: true,
                                  labelInterval: 10.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 370.0,
                              height: 230.0,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.HUMEDAD.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                          .jsonBody,
                                      r'''$.HUMEDAD.AMBIENTE.lista_valores''',
                                    ),
                                    settings: LineChartBarData(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      barWidth: 2.0,
                                      isCurved: true,
                                    ),
                                  )
                                ],
                                chartStylingInfo: ChartStylingInfo(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  showBorder: false,
                                ),
                                axisBounds: AxisBounds(
                                  minY: 0.0,
                                  maxY: 100.0,
                                ),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Fecha',
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: getJsonField(
                                    rowRegistrosSensoresAllFromPlantBetweenDatesToGraphResponse
                                        .jsonBody,
                                    r'''$.HUMEDAD.AMBIENTE.unidad_medida''',
                                  ).toString(),
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  showLabels: true,
                                  labelInterval: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
