import 'dart:convert';
import 'package:http/http.dart' as http;
import 'apiConfig.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({this.baseUrl = baseURL});

  Future<dynamic> get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl$path'));
    return _handleResponse(response);
  }

  Future<dynamic> post(String path, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final body = response.body.trim();

      if (body.toLowerCase() == 'true') return true;
      if (body.toLowerCase() == 'false') return false;

      return jsonDecode(body);
    } else if (response.statusCode == 400) {
      throw Exception('Bad request: ${response.body}');
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else if (response.statusCode == 404) {
      throw Exception('Item Not found');
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}
