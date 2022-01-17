import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';

import '../app_router.dart';

class CheckIsAuth extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuth = await authService().isLoggedIn;
    if (isAuth) {
      resolver.next(true);
    } else {
      router.replace(const AuthRouter());
    }
  }
}
