import 'dart:convert';

import 'package:chucknoris/constants/strings.dart';
import 'package:chucknoris/models/fact.dart';
import 'package:http/http.dart' as http;

class API_MANAGER {
  Future<FactsModel> getFacts() async {
    var client = http.Client();
    var factsModel = null;
    try {
      var response = await client.get(Strings.facts_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        factsModel = FactsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return factsModel;
    }
    return factsModel;
  }
}
