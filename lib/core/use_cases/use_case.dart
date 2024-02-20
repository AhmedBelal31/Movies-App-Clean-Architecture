abstract class UseCase<Type, Param> {
  Future<Type> execute([Param param]);
}
