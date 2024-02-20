import 'package:dio/dio.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getData(String endPoint) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
