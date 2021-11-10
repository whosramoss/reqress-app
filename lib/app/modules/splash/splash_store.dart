import 'dart:developer';

import 'package:reqresapp/app/shared/storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  _SplashStoreBase() {
    checkToken();
  }

  @action
  Future<void> checkToken() async {
    bool haveToken = await ReqressStorage.containUserToken();
    if (!haveToken) {
      Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
    } else {
      Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
    }
  }
}
