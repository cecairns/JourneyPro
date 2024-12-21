import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CurrencyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Currency',
      apiUrl:
          'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_peLTX9ml6PV5M2QPpOnaIJXYXfzrGQxGIGFKGWam',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static double? aud(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.AUD''',
      ));
  static double? bgn(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.BGN''',
      ));
  static double? brl(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.BRL''',
      ));
  static double? cad(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.CAD''',
      ));
  static double? chf(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.CHF''',
      ));
  static double? cny(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.CNY''',
      ));
  static double? czk(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.CZK''',
      ));
  static double? dkk(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.DKK''',
      ));
  static double? eur(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.EUR''',
      ));
  static double? gbp(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.GBP''',
      ));
  static double? hkd(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.HKD''',
      ));
  static double? hrk(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.HRK''',
      ));
  static double? idr(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.IDR''',
      ));
  static double? ils(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.ILS''',
      ));
  static double? huf(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.HUF''',
      ));
  static double? inr(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.INR''',
      ));
  static double? isk(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.ISK''',
      ));
  static double? jpy(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.JPY''',
      ));
  static double? krw(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.KRW''',
      ));
  static double? mxn(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.MXN''',
      ));
  static double? myr(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.MYR''',
      ));
  static double? nok(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.NOK''',
      ));
  static double? nzd(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.NZD''',
      ));
  static double? php(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.PHP''',
      ));
  static double? pln(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.PLN''',
      ));
  static double? ron(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.RON''',
      ));
  static double? rub(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.RUB''',
      ));
  static double? sek(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.SEK''',
      ));
  static double? sgd(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.SGD''',
      ));
  static double? thb(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.THB''',
      ));
  static double? tRYCur(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.TRY''',
      ));
  static int? usd(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.USD''',
      ));
  static double? zar(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.ZAR''',
      ));
}

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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
