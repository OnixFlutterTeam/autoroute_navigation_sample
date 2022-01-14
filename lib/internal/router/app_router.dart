import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/auth/sign_up/email_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/auth/sign_up/password_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/home_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/favourites/favourites_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/info/info_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/products/add/add_product_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/products/complete/congratulations_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/products/list/products_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/main_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/product/product_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/profile/profile_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/settings/inner_screens/notification_settings.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/settings/inner_screens/other_settings.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/settings/inner_screens/user_settings.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/settings/settings_screen.dart';
import 'package:auto_route_demo_flow/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'guard/auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true, path: '/'),
    AutoRoute(
      path: '/auth',
      name: 'AuthRouter',
      page: EmptyRouterScreen,
      children: [
        CustomRoute(
          initial: true,
          path: 'signIn',
          page: SignInScreen,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'signUp',
          page: SignUpScreen,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          children: [
            CustomRoute(
              path: 'email',
              page: EmailScreen,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            ),
            CustomRoute(
              path: 'password',
              page: PasswordScreen,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: '/main',
      name: 'MainRouter',
      page: EmptyRouterScreen,
      guards: [CheckIsAuth],
      children: [
        AutoRoute(path: '', page: MainScreen),
        AutoRoute(path: 'profile', page: ProfileScreen),
        AutoRoute(
          path: 'settings',
          page: SettingsScreen,
          children: [
            CustomRoute(
              path: 'notification',
              page: NotificationSettingsScreen,
              transitionsBuilder: TransitionsBuilders.zoomIn,
              initial: true,
            ),
            CustomRoute(
              path: 'other',
              page: OtherSettingsScreen,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            ),
            CustomRoute(
              path: 'user',
              page: UserSettingsScreen,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
          ],
        ),
        AutoRoute(
          path: 'home',
          page: HomeScreen,
          children: [
            AutoRoute(
              page: EmptyRouterScreen,
              path: 'products',
              name: 'ProductsRouter',
              children: [
                AutoRoute(
                  page: ProductsScreen,
                  initial: true,
                  path: 'product_list',
                  name: 'ProductListRouter',
                ),
                AutoRoute(page: AddProductScreen, path: 'add_product'),
                AutoRoute(page: CongratulationsScreen, path: 'congratulation'),
              ],
            ),
            AutoRoute(page: InfoScreen, path: 'info'),
            AutoRoute(page: FavouritesScreen, path: 'favourite'),
          ],
        ),
        AutoRoute(
          page: ProductScreen,
          path: 'product',
          name: 'ProductItemRouter',
        ),
      ],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required this.isAuth}) : super(checkIsAuth: isAuth);

  final CheckIsAuth isAuth;
}
