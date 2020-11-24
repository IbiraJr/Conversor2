import 'dart:convert';

import 'package:conversor2/model/currencies.dart';
import 'package:http/http.dart' as http;
import 'api_constant.dart';

class ApiConvert {
  String key = '${ApiConstant.keyApi}';
  Future<List<Ars>> getList() async {
    http.Response response = await http.get(key);
    if (response.body != null) {
      var jsonBody = jsonDecode(response.body);
      var currencies = Currencies.fromJson(jsonBody);
      List<Ars> list = [
        currencies.results.currencies.ars,
        currencies.results.currencies.aud,
        currencies.results.currencies.btc,
        currencies.results.currencies.cad,
        currencies.results.currencies.cny,
        currencies.results.currencies.eur,
        currencies.results.currencies.gbp,
        currencies.results.currencies.jpy,
        currencies.results.currencies.usd
      ];
      return list;
    }
  }
}
