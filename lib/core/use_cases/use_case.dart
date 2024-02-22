import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>>  execute([Param param]);
}
