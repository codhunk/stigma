// ignore_for_file: avoid_types_as_parameter_names, duplicate_ignore

import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static const String _baseUrl = "https://api.example.com";

  // ignore: duplicate_ignore
  // ignore: avoid_types_as_parameter_names
  static Future<Map<String, dynamic>> get(String, endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
    // ignore: avoid_types_as_parameter_names
    String,
    endpoint,
    dynamic data,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Context-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(
    // ignore: non_constant_identifier_names
    String,
    endpoint,
    dynamic data,
  ) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Context-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String, endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
