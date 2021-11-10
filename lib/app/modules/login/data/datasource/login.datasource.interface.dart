import 'package:dartz/dartz.dart';
import 'package:reqresapp/app/modules/login/domain/exceptions/login.failure.dart';

abstract class ILoginDatasource {
  Future<Either<LoginFailure, String>> login(String login, String password);
}
