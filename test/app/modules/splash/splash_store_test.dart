import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reqresapp/app/modules/splash/splash_module.dart';
import 'package:reqresapp/app/modules/splash/splash_store.dart';

void main() {
  initModule(SplashModule());
  SplashStore splash;

  setUp(() {
    splash = SplashModule.to.get<SplashStore>();
  });

  group('SplashStore Test', () {
    test("- [Instance of SplashStore] - ", () {
      expect(splash, isInstanceOf<SplashStore>());
    });
  });
}
