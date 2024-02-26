import 'package:dio/dio.dart';
import 'package:movies_app_clean_architecture/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture/core/network/error_message_model.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getData({required String endPoint, int pageNumber =1}) async {
    var response = await _dio.get('$baseUrl$endPoint?api_key=$apiKey&page=$pageNumber');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
