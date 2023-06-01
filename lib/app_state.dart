import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _rsidPrueba = 1;
  int get rsidPrueba => _rsidPrueba;
  set rsidPrueba(int _value) {
    _rsidPrueba = _value;
  }

  int _diasgraficar = 1;
  int get diasgraficar => _diasgraficar;
  set diasgraficar(int _value) {
    _diasgraficar = _value;
  }

  String _plantagraficar = 'Mi tomatera';
  String get plantagraficar => _plantagraficar;
  set plantagraficar(String _value) {
    _plantagraficar = _value;
  }

  dynamic _datospruebas = jsonDecode(
      '{\"TEMPERATURA\":{\"AMBIENTE\":{\"lista_fechas_cortas\":[\"31 18\",\"31 19\",\"31 20\",\"31 21\",\"31 22\",\"31 23\",\"01 00\",\"01 01\",\"01 02\",\"01 03\",\"01 04\",\"01 05\",\"01 06\",\"01 07\",\"01 08\",\"01 09\",\"01 10\",\"01 11\",\"01 12\",\"01 13\",\"01 14\",\"01 15\",\"01 16\",\"01 17\"],\"lista_fechas_largas\":[\"2023-05-31 18:00:00\",\"2023-05-31 19:00:00\",\"2023-05-31 20:00:00\",\"2023-05-31 21:00:00\",\"2023-05-31 22:00:00\",\"2023-05-31 23:00:00\",\"2023-06-01 00:00:00\",\"2023-06-01 01:00:00\",\"2023-06-01 02:00:00\",\"2023-06-01 03:00:00\",\"2023-06-01 04:00:00\",\"2023-06-01 05:00:00\",\"2023-06-01 06:00:00\",\"2023-06-01 07:00:00\",\"2023-06-01 08:00:00\",\"2023-06-01 09:00:00\",\"2023-06-01 10:00:00\",\"2023-06-01 11:00:00\",\"2023-06-01 12:00:00\",\"2023-06-01 13:00:00\",\"2023-06-01 14:00:00\",\"2023-06-01 15:00:00\",\"2023-06-01 16:00:00\",\"2023-06-01 17:00:00\"],\"lista_valores\":[23,23,23,23,24,24,24,0,0,0,23,23,23,23,23,23,24,20,23,23,23,24,24,24],\"lista_valores_maximos\":[20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20],\"lista_valores_minimos\":[15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15],\"tipo_medida\":{\"nombre\":\"Temperatura\",\"tipo\":\"TEMPERATURA\"},\"unidad_medida\":{\"nombre\":\"ºC\",\"tipo\":\"GRADOS_CENTIGRADOS\"},\"zona_sensor\":{\"nombre\":\"Ambiente\",\"tipo\":\"AMBIENTE\"}},\"MACETA\":{\"lista_fechas_cortas\":[],\"lista_fechas_largas\":[],\"lista_valores\":[],\"tipo_medida\":{\"nombre\":\"Temperatura\",\"tipo\":\"TEMPERATURA\"},\"unidad_medida\":{\"nombre\":\"ºC\",\"tipo\":\"GRADOS_CENTIGRADOS\"},\"zona_sensor\":{\"nombre\":\"Maceta\",\"tipo\":\"MACETA\"}},\"OTRA\":{\"lista_fechas_cortas\":[],\"lista_fechas_largas\":[],\"lista_valores\":[],\"tipo_medida\":{\"nombre\":\"Temperatura\",\"tipo\":\"TEMPERATURA\"},\"unidad_medida\":{\"nombre\":\"ºC\",\"tipo\":\"GRADOS_CENTIGRADOS\"},\"zona_sensor\":{\"nombre\":\"Otra\",\"tipo\":\"OTRA\"}},\"SIN_ZONA\":{\"lista_fechas_cortas\":[],\"lista_fechas_largas\":[],\"lista_valores\":[],\"tipo_medida\":{\"nombre\":\"Temperatura\",\"tipo\":\"TEMPERATURA\"},\"unidad_medida\":{\"nombre\":\"ºC\",\"tipo\":\"GRADOS_CENTIGRADOS\"},\"zona_sensor\":{\"nombre\":\"Sin zona\",\"tipo\":\"SIN_ZONA\"}},\"SUELO\":{\"lista_fechas_cortas\":[],\"lista_fechas_largas\":[],\"lista_valores\":[],\"tipo_medida\":{\"nombre\":\"Temperatura\",\"tipo\":\"TEMPERATURA\"},\"unidad_medida\":{\"nombre\":\"ºC\",\"tipo\":\"GRADOS_CENTIGRADOS\"},\"zona_sensor\":{\"nombre\":\"Suelo\",\"tipo\":\"SUELO\"}}}}');
  dynamic get datospruebas => _datospruebas;
  set datospruebas(dynamic _value) {
    _datospruebas = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
