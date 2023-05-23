import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<ApiCallResponse>(
                future:
                    (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                          ..complete(RegistrosSensoresGroup.oneCall.call(
                            rsid: FFAppState().rsidPrueba,
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
                  final containerOneResponse = snapshot.data!;
                  return Container(
                    width: 426.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          getJsonField(
                            containerOneResponse.jsonBody,
                            r'''$.id''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          getJsonField(
                            containerOneResponse.jsonBody,
                            r'''$.valor''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          getJsonField(
                            containerOneResponse.jsonBody,
                            r'''$.numero_sensor''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      setState(() => _model.apiRequestCompleter = null);
                      await _model.waitForApiRequestCompleted();
                    },
                    text: 'Button',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                      count: _model.countControllerValue ??= 0,
                      updateCount: (count) async {
                        setState(() => _model.countControllerValue = count);
                        setState(() {
                          FFAppState().rsidPrueba =
                              _model.countControllerValue!;
                        });
                      },
                      stepSize: 1,
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      FFAppState().rsidPrueba.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: RegistrosSensoresGroup.allCall.call(),
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
                    final listViewAllResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final listaRegistros = listViewAllResponse.jsonBody
                            .toList()
                            .take(200)
                            .toList();
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
                              height: 100.0,
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
                                      getJsonField(
                                        listaRegistrosItem,
                                        r'''$.id''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      getJsonField(
                                        listaRegistrosItem,
                                        r'''$.valor''',
                                      )
                                          .toString()
                                          .maybeHandleOverflow(maxChars: 5),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      getJsonField(
                                        listaRegistrosItem,
                                        r'''$.unidad_medida.nombre''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      getJsonField(
                                        listaRegistrosItem,
                                        r'''$.tipo_sensor.nombre''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      getJsonField(
                                        listaRegistrosItem,
                                        r'''$.zona_sensor.nombre''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      getJsonField(
                                        listaRegistrosItem,
                                        r'''$.numero_sensor''',
                                      ).toString(),
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
                    );
                  },
                ),
              ),
              Expanded(
                child: PagedListView<ApiPagingParams, dynamic>(
                  pagingController: () {
                    if (_model.pagingController != null) {
                      return _model.pagingController!;
                    }

                    _model.pagingController = PagingController(
                      firstPageKey: ApiPagingParams(
                        nextPageNumber: 0,
                        numItems: 0,
                        lastResponse: null,
                      ),
                    );
                    _model.pagingController!
                        .addPageRequestListener((nextPageMarker) {
                      RegistrosSensoresGroup.allFromPlantToGraphCall
                          .call(
                        np: 'Mi tomatera',
                      )
                          .then((listViewAllFromPlantToGraphResponse) {
                        final pageItems = (getJsonField(
                                  listViewAllFromPlantToGraphResponse.jsonBody,
                                  r'''$.TEMPERATURA.AMBIENTE.lista_valores''',
                                ) ??
                                [])
                            .take(200 - nextPageMarker.numItems)
                            .toList() as List;
                        final newNumItems =
                            nextPageMarker.numItems + pageItems.length;
                        _model.pagingController!.appendPage(
                          pageItems,
                          (pageItems.length > 0) && newNumItems < 200
                              ? ApiPagingParams(
                                  nextPageNumber:
                                      nextPageMarker.nextPageNumber + 1,
                                  numItems: newNumItems,
                                  lastResponse:
                                      listViewAllFromPlantToGraphResponse,
                                )
                              : null,
                        );
                      });
                    });
                    return _model.pagingController!;
                  }(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, listaRegistrosIndex) {
                      final listaRegistrosItem = _model
                          .pagingController!.itemList![listaRegistrosIndex];
                      return Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                listaRegistrosItem
                                    .toString()
                                    .maybeHandleOverflow(maxChars: 5),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              FutureBuilder<ApiCallResponse>(
                future: RegistrosSensoresGroup.allFromPlantToGraphCall.call(
                  np: 'Mi tomatera',
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
                  final containerAllFromPlantToGraphResponse = snapshot.data!;
                  return Container(
                    width: 426.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 370.0,
                              height: 230.0,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: getJsonField(
                                      containerAllFromPlantToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_fechas''',
                                    ),
                                    yData: getJsonField(
                                      containerAllFromPlantToGraphResponse
                                          .jsonBody,
                                      r'''$.TEMPERATURA.AMBIENTE.lista_valores''',
                                    ),
                                    settings: LineChartBarData(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  minY: -10.0,
                                  maxY: 50.0,
                                ),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Fecha',
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  showLabels: true,
                                  labelInterval: 100.0,
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: getJsonField(
                                    containerAllFromPlantToGraphResponse
                                        .jsonBody,
                                    r'''$.TEMPERATURA.AMBIENTE.unidad_medida.nombre''',
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
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
