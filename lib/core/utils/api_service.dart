import 'package:dio/dio.dart';

class ApiService {
  // final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final String apiKey = 'AIzaSyAdzsxBmUBt1NSxx8nrztWJ6CLWVX3Jai4';
  // final String _baseUrl = 'https://openlibrary.org/search.json';

  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
