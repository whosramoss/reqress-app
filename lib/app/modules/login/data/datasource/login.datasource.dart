import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:reqresapp/app/modules/login/data/models/auth.model.dart';
import 'package:reqresapp/app/modules/login/domain/exceptions/login.failure.dart';

import '../../../../shared/endpoints.dart';
import 'login.datasource.interface.dart';

class LoginDatasource implements ILoginDatasource {
  @override
  Future<Either<LoginFailure, String>> login(
      String email, String password) async {
    try {
      var response = await Dio().post(
        "${ReqresEndpoints.url}/api/login",
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthModel _authModel = AuthModel.fromJson(response.data);
        return right(_authModel.id);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 403) {
        return left(LoginNotFoundFailure());
      }
      return left(LoginServerErrorFailure(error: e.error));
    } catch (e) {
      return left(LoginServerErrorFailure(error: e.toString()));
    }
  }
}
