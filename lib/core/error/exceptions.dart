import 'package:movies_app_clean_architecture/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocalDatabaseException implements Exception {
  final String errorMessage;

  LocalDatabaseException({required this.errorMessage});
}
