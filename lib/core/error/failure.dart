abstract class Failure {
  final String errorMessage ;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure
{
  ServerFailure({required super.errorMessage});

}
class DatabaseFailure extends Failure
{
  DatabaseFailure({required super.errorMessage});

}