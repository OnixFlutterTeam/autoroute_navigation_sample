import 'package:auto_route_demo_flow/arch/logger.dart';
import 'package:auto_route_demo_flow/data/services/mock_service.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';

class AppInitialization {
  AppInitialization._privateConstructor();

  static final AppInitialization _instance =
      AppInitialization._privateConstructor();

  static AppInitialization get I => _instance;

  Future<void> initApp() async {
    var app = await Firebase.initializeApp();

    setUpServiceLocator();
    MockService().create();
    Logger.log('APP Init: done');
  }
}
