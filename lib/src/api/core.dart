import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:core_reader/src/api/models/models.dart';

abstract class CoreClient {
  static String baseUrl = "http://192.168.1.38:5000";

  static Future<List<Source>> getSources(SourceType type) async {
    var uri = Uri.parse(baseUrl);
    if (type == SourceType.comics) {
      uri = uri.replace(
        path: '/comics/'
      );
    } else {
      uri = uri.replace(
        path: '/manga/'
      );
    }

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var obj = Source.fromJsonList(map);
      return obj;
    } else {
      throw Exception("Could not retrieve source list");
    }
  }

  static Future<Information> getSourceInfo(String endpoint) async {
    var uri = Uri.parse(baseUrl);
    uri = uri.replace(
      path: endpoint
    );

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var obj = Information.fromJson(map);
      return obj;
    } else {
      throw Exception("Could not retrieve source information");
    }
  }

  static Future<List<Result>> searchSource(String endpointWithQuery) async {
    var uri = Uri.parse(baseUrl);
    uri = uri.replace(
      path: endpointWithQuery
    );

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var obj = Result.fromJsonList(map);
      return obj;
    } else {
      throw Exception("Could not search this source");
    }
  }

  static Future<Item> getItemDetails(String detailEndpoint) async {
    var uri = Uri.parse(baseUrl);
    uri = uri.replace(
        path: detailEndpoint
    );

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var obj = Item.fromJson(map);
      return obj;
    } else {
      throw Exception("Could not retrieve item details");
    }
  }

  static Future<Chapter> getChapter(String chapterEndpoint) async {
    var uri = Uri.parse(baseUrl);
    uri = uri.replace(
        path: chapterEndpoint
    );

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var obj = Chapter.fromJson(map);
      return obj;
    } else {
      throw Exception("Could not retrieve item details");
    }
  }
}