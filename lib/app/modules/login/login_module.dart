import 'package:reqresapp/app/modules/login/presenter/stores/login_store.dart';
import 'data/datasource/login.datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginDatasource()),
        Bind((i) => LoginStore(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
