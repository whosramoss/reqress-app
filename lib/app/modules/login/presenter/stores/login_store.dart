import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:reqresapp/app/modules/login/data/datasource/login.datasource.interface.dart';
import 'package:reqresapp/app/modules/login/domain/exceptions/login.failure.dart';
import 'package:reqresapp/app/shared/storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginDatasource _datasource;

  @observable
  Option<LoginFailure> failure;

  @observable
  String messageError;

  @observable
  bool haveError = false;

  @observable
  bool loading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  changeEmail(String value) => email = value;

  @action
  changePassword(String value) => password = value;

  @computed
  bool get isValid {
    return validateEmail() == null && validatePassword() == null;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return "Campo Obrigatorio";
    } else if (!email.contains("@")) {
      return "Email invalido";
    }

    return null;
  }

  String validatePassword() {
    if (password == null || password.isEmpty) {
      return "Campo Obrigatorio";
    }

    return null;
  }

  _LoginStoreBase(this._datasource) {
    reaction((_) => failure, (_) {
      controlFailures(failure);
    });
  }

  @action
  Future<void> login() async {
    haveError = false;
    loading = true;
    failure = none();

    final loginResult = await _datasource.login(email, password);

    loginResult.fold(
      (failureResult) {
        failure = optionOf(failureResult);
        haveError = true;
        loading = false;
      },
      (id) async {
        ReqressStorage.setUserEmail(email);
        ReqressStorage.setUserToken(id);
        loading = false;
        Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
      },
    );
  }

  controlFailures(Option<LoginFailure> failure) {
    failure.map((fail) {
      haveError = true;
      if (fail is LoginNotFoundFailure) {
        messageError = 'Login ou senha inválidos';
      }
      if (fail is LoginServerErrorFailure) {
        messageError = 'Erro ao realizar Login';
      }
    });
  }
}
