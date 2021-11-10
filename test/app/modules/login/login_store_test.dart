import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reqresapp/app/modules/login/login_module.dart';
import 'package:reqresapp/app/modules/login/presenter/stores/login_store.dart';

void main() {
  initModule(LoginModule());
  LoginStore login;

  setUp(() {
    login = LoginModule.to.get<LoginStore>();
  });

  group('LoginController Test', () {
    test(" - [Instance of LoginStore] -", () {
      expect(login, isInstanceOf<LoginStore>());
    });
  });
}
