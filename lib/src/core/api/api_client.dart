import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

/// A simple API client for making HTTP requests.
class ApiClient {
  /// Creates an [ApiClient].
  ///
  /// An optional [http.Client] can be provided for testing purposes.
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const String _baseUrl =
      'https://74j6q7lg6a.execute-api.eu-west-1.amazonaws.com/';

  /// Performs a GET request to the specified [path].
  ///
  /// An optional [queryParameters] map can be provided.
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.parse(
      '$_baseUrl$path',
    ).replace(queryParameters: queryParameters);

    final response = await _client.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}

/// Provides an instance of [ApiClient].
final apiClientProvider = Provider((ref) => ApiClient(client: http.Client()));
