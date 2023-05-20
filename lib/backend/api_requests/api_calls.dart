import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start RegistrosSensores Group Code

class RegistrosSensoresGroup {
  static String baseUrl = 'http://192.168.1.27:5000/api/v1/RegistrosSensores';
  static Map<String, String> headers = {};
  static OneCall oneCall = OneCall();
  static AllCall allCall = AllCall();
}

class OneCall {
  Future<ApiCallResponse> call({
    int? rsid = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'One',
      apiUrl: '${RegistrosSensoresGroup.baseUrl}/One',
      callType: ApiCallType.GET,
      headers: {
        ...RegistrosSensoresGroup.headers,
      },
      params: {
        'rsid': rsid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AllCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'All',
      apiUrl: '${RegistrosSensoresGroup.baseUrl}/All',
      callType: ApiCallType.GET,
      headers: {
        ...RegistrosSensoresGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End RegistrosSensores Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
