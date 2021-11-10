import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:reqresapp/app/modules/home/data/datasource/home.datasource.interface.dart';
import 'package:reqresapp/app/modules/home/data/models/user.model.dart';
import 'package:reqresapp/app/modules/home/domain/exceptions/home.failure.dart';
import 'package:reqresapp/app/shared/storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final IHomeDatasource _datasource;

  _HomeStoreBase(this._datasource) {
    getData();
    fetchUsersList();
  }

  @observable
  List<UserModel> _users = [];

  @computed
  List<UserModel> get usersAPI => _users;

  @observable
  bool loading = false;

  @observable
  Option<HomeFailure> failure;

  @observable
  String email;

  @observable
  String id;

  @action
  Future<void> clearData() async {
    ReqressStorage.clearStorage();
    Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
  }

  @action
  Future<void> getData() async {
    email = await ReqressStorage.getUserEmail();
    id = await ReqressStorage.getUserToken();
  }

  @action
  Future<List<UserModel>> fetchUsersList() async {
    loading = true;
    failure = none();

    final homeResult = await _datasource.getUsers();

    homeResult.fold(
      (failureResult) {
        failure = optionOf(failureResult);
        loading = false;
      },
      (users) {
        _users = users;
        loading = false;
      },
    );
  }
}
