import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:reqresapp/app/modules/home/data/datasource/home.datasource.interface.dart';
import 'package:reqresapp/app/modules/home/data/models/user.model.dart';
import 'package:reqresapp/app/modules/home/domain/exceptions/home.failure.dart';
import '../../../../shared/endpoints.dart';

class HomeDatasource implements IHomeDatasource {
  @override
  Future<Either<HomeFailure, List<UserModel>>> getUsers() async {
    try {
      var response = await Dio().get("${ReqresEndpoints.url}/users?page=1");
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<UserModel> _list = <UserModel>[];
        List data = response.data["data"];
        for (Map i in data) {
          _list.add(UserModel.fromJson(i));
        }
        return right(_list);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 403) {
        return left(HomeNotFoundFailure());
      }
      return left(HomeServerErrorFailure(error: e.error));
    } catch (e) {
      return left(HomeServerErrorFailure(error: e.toString()));
    }
  }
}
