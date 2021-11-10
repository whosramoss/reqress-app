import 'package:dartz/dartz.dart';
import 'package:reqresapp/app/modules/home/data/models/user.model.dart';
import 'package:reqresapp/app/modules/home/domain/exceptions/home.failure.dart';

abstract class IHomeDatasource {
  Future<Either<HomeFailure, List<UserModel>>> getUsers();
}
