// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.checkIsAuth})
      : super(navigatorKey);

  final CheckIsAuth checkIsAuth;

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreen());
    },
    AuthRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterScreen());
    },
    MainRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterScreen());
    },
    SignInRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignInScreen(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SignUpRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignUpScreen(),
          transitionsBuilder: TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    EmailRoute.name: (routeData) {
      final args = routeData.argsAs<EmailRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: EmailScreen(key: args.key, onNext: args.onNext),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    PasswordRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: PasswordScreen(key: args.key, onNext: args.onNext),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainScreen());
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileScreen());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsScreen());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    ProductItemRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductItemRouterArgs>(
          orElse: () => ProductItemRouterArgs(
              productId: pathParams.getInt('productId'),
              showRemoveBtn: pathParams.getBool('showRemoveBtn', true)));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProductScreen(
              key: args.key,
              productId: args.productId,
              showRemoveBtn: args.showRemoveBtn));
    },
    NotificationSettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const NotificationSettingsScreen(),
          transitionsBuilder: TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    OtherSettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const OtherSettingsScreen(),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    UserSettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserSettingsScreen(),
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    ProductsRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterScreen());
    },
    InfoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const InfoScreen());
    },
    FavouritesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const FavouritesScreen());
    },
    ProductListRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProductsScreen());
    },
    AddProductRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AddProductScreen());
    },
    CongratulationsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CongratulationsScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(AuthRouter.name, path: '/auth', children: [
          RouteConfig('#redirect',
              path: '',
              parent: AuthRouter.name,
              redirectTo: 'signIn',
              fullMatch: true),
          RouteConfig(SignInRoute.name,
              path: 'signIn', parent: AuthRouter.name),
          RouteConfig(SignUpRoute.name,
              path: 'signUp',
              parent: AuthRouter.name,
              children: [
                RouteConfig(EmailRoute.name,
                    path: 'email', parent: SignUpRoute.name),
                RouteConfig(PasswordRoute.name,
                    path: 'password', parent: SignUpRoute.name)
              ])
        ]),
        RouteConfig(MainRouter.name, path: '/main', guards: [
          checkIsAuth
        ], children: [
          RouteConfig(MainRoute.name, path: '', parent: MainRouter.name),
          RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRouter.name),
          RouteConfig(SettingsRoute.name,
              path: 'settings',
              parent: MainRouter.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: SettingsRoute.name,
                    redirectTo: 'notification',
                    fullMatch: true),
                RouteConfig(NotificationSettingsRoute.name,
                    path: 'notification', parent: SettingsRoute.name),
                RouteConfig(OtherSettingsRoute.name,
                    path: 'other', parent: SettingsRoute.name),
                RouteConfig(UserSettingsRoute.name,
                    path: 'user', parent: SettingsRoute.name)
              ]),
          RouteConfig(HomeRoute.name,
              path: 'home',
              parent: MainRouter.name,
              children: [
                RouteConfig(ProductsRouter.name,
                    path: 'products',
                    parent: HomeRoute.name,
                    children: [
                      RouteConfig('#redirect',
                          path: '',
                          parent: ProductsRouter.name,
                          redirectTo: 'product_list',
                          fullMatch: true),
                      RouteConfig(ProductListRouter.name,
                          path: 'product_list', parent: ProductsRouter.name),
                      RouteConfig(AddProductRoute.name,
                          path: 'add_product', parent: ProductsRouter.name),
                      RouteConfig(CongratulationsRoute.name,
                          path: 'congratulation', parent: ProductsRouter.name)
                    ]),
                RouteConfig(InfoRoute.name,
                    path: 'info', parent: HomeRoute.name),
                RouteConfig(FavouritesRoute.name,
                    path: 'favourite', parent: HomeRoute.name)
              ]),
          RouteConfig(ProductItemRouter.name,
              path: 'product', parent: MainRouter.name)
        ])
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [EmptyRouterScreen]
class AuthRouter extends PageRouteInfo<void> {
  const AuthRouter({List<PageRouteInfo>? children})
      : super(AuthRouter.name, path: '/auth', initialChildren: children);

  static const String name = 'AuthRouter';
}

/// generated route for
/// [EmptyRouterScreen]
class MainRouter extends PageRouteInfo<void> {
  const MainRouter({List<PageRouteInfo>? children})
      : super(MainRouter.name, path: '/main', initialChildren: children);

  static const String name = 'MainRouter';
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(SignUpRoute.name, path: 'signUp', initialChildren: children);

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [EmailScreen]
class EmailRoute extends PageRouteInfo<EmailRouteArgs> {
  EmailRoute({Key? key, required dynamic Function(String) onNext})
      : super(EmailRoute.name,
            path: 'email', args: EmailRouteArgs(key: key, onNext: onNext));

  static const String name = 'EmailRoute';
}

class EmailRouteArgs {
  const EmailRouteArgs({this.key, required this.onNext});

  final Key? key;

  final dynamic Function(String) onNext;

  @override
  String toString() {
    return 'EmailRouteArgs{key: $key, onNext: $onNext}';
  }
}

/// generated route for
/// [PasswordScreen]
class PasswordRoute extends PageRouteInfo<PasswordRouteArgs> {
  PasswordRoute({Key? key, required dynamic Function(String) onNext})
      : super(PasswordRoute.name,
            path: 'password',
            args: PasswordRouteArgs(key: key, onNext: onNext));

  static const String name = 'PasswordRoute';
}

class PasswordRouteArgs {
  const PasswordRouteArgs({this.key, required this.onNext});

  final Key? key;

  final dynamic Function(String) onNext;

  @override
  String toString() {
    return 'PasswordRouteArgs{key: $key, onNext: $onNext}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '');

  static const String name = 'MainRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(SettingsRoute.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProductScreen]
class ProductItemRouter extends PageRouteInfo<ProductItemRouterArgs> {
  ProductItemRouter(
      {Key? key, required int productId, bool showRemoveBtn = true})
      : super(ProductItemRouter.name,
            path: 'product',
            args: ProductItemRouterArgs(
                key: key, productId: productId, showRemoveBtn: showRemoveBtn),
            rawPathParams: {
              'productId': productId,
              'showRemoveBtn': showRemoveBtn
            });

  static const String name = 'ProductItemRouter';
}

class ProductItemRouterArgs {
  const ProductItemRouterArgs(
      {this.key, required this.productId, this.showRemoveBtn = true});

  final Key? key;

  final int productId;

  final bool showRemoveBtn;

  @override
  String toString() {
    return 'ProductItemRouterArgs{key: $key, productId: $productId, showRemoveBtn: $showRemoveBtn}';
  }
}

/// generated route for
/// [NotificationSettingsScreen]
class NotificationSettingsRoute extends PageRouteInfo<void> {
  const NotificationSettingsRoute()
      : super(NotificationSettingsRoute.name, path: 'notification');

  static const String name = 'NotificationSettingsRoute';
}

/// generated route for
/// [OtherSettingsScreen]
class OtherSettingsRoute extends PageRouteInfo<void> {
  const OtherSettingsRoute() : super(OtherSettingsRoute.name, path: 'other');

  static const String name = 'OtherSettingsRoute';
}

/// generated route for
/// [UserSettingsScreen]
class UserSettingsRoute extends PageRouteInfo<void> {
  const UserSettingsRoute() : super(UserSettingsRoute.name, path: 'user');

  static const String name = 'UserSettingsRoute';
}

/// generated route for
/// [EmptyRouterScreen]
class ProductsRouter extends PageRouteInfo<void> {
  const ProductsRouter({List<PageRouteInfo>? children})
      : super(ProductsRouter.name, path: 'products', initialChildren: children);

  static const String name = 'ProductsRouter';
}

/// generated route for
/// [InfoScreen]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute() : super(InfoRoute.name, path: 'info');

  static const String name = 'InfoRoute';
}

/// generated route for
/// [FavouritesScreen]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: 'favourite');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [ProductsScreen]
class ProductListRouter extends PageRouteInfo<void> {
  const ProductListRouter()
      : super(ProductListRouter.name, path: 'product_list');

  static const String name = 'ProductListRouter';
}

/// generated route for
/// [AddProductScreen]
class AddProductRoute extends PageRouteInfo<void> {
  const AddProductRoute() : super(AddProductRoute.name, path: 'add_product');

  static const String name = 'AddProductRoute';
}

/// generated route for
/// [CongratulationsScreen]
class CongratulationsRoute extends PageRouteInfo<void> {
  const CongratulationsRoute()
      : super(CongratulationsRoute.name, path: 'congratulation');

  static const String name = 'CongratulationsRoute';
}
