import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  final String _baseUrl = 'http://127.0.0.1:8000';

  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
