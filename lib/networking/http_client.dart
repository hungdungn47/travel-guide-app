import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:travel_guide_app/networking/config.dart';

typedef JSON = Map<String, dynamic>;

class HttpClient {
  static String baseUrl = Config.baseUrl;
  static final client = RetryClient(http.Client());
  static Future<JSON?> get({required String endPoint, JSON? queryParams}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.get(url);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }
    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  static Future<List<dynamic>> getList(
      {required String endPoint, JSON? queryParams}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.get(url);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return [];
    }

    final List<dynamic> parsed = json.decode(response.body);
    return parsed;
  }

  static Future<JSON?> post(
      {required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.post(url, body: body);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  static Future<List<dynamic>> postList(
      {required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.post(url, body: body);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return [];
    }

    final List<dynamic> parsed = json.decode(response.body);
    return parsed;
  }

  static Future<JSON?> delete(
      {required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.delete(url, body: body);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  static Future<JSON?> put(
      {required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.put(url, body: body);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  static Future<List<dynamic>> putList(
      {required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.put(url, body: body);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return [];
    }

    final List<dynamic> parsed = json.decode(response.body);
    return parsed;
  }

  static Future<JSON?> patch(
      {required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.patch(url, body: body);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  static Future<List<dynamic>> patchList(
      {required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    var response = await client.patch(url, body: body);
    if (response.statusCode != 204 && response.statusCode != 200) {
      return [];
    }

    final List<dynamic> parsed = json.decode(response.body);
    return parsed;
  }
}