import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reqresapp/app/modules/Home/Home_module.dart';
import 'package:reqresapp/app/modules/home/presenter/store/home.store.dart';

void main() {
  initModule(HomeModule());
  HomeStore home;

  setUp(() {
    home = HomeModule.to.get<HomeStore>();
  });

  group('HomeController Test', () {
    test(" - [Instance of HomeStore] -", () {
      expect(home, isInstanceOf<HomeStore>());
    });
  });
}
