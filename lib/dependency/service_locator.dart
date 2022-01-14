import 'package:auto_route_demo_flow/data/local/source/product/product_source.dart';
import 'package:auto_route_demo_flow/data/local/source/product/product_source_impl.dart';
import 'package:auto_route_demo_flow/data/services/auth_service.dart';
import 'package:auto_route_demo_flow/data/services/dynamic_link_service.dart';
import 'package:auto_route_demo_flow/domain/repository/favourite/product_favourite_repository.dart';
import 'package:auto_route_demo_flow/domain/repository/favourite/product_favourite_repository_impl.dart';
import 'package:auto_route_demo_flow/domain/repository/product/product_repository.dart';
import 'package:auto_route_demo_flow/domain/repository/product/product_repository_impl.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/internal/router/guard/auth_guard.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_bloc.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/favourites/bloc/fav_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setUpServiceLocator() {
  //SERVICE
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerLazySingleton<DynamicLinkService>(() => DynamicLinkService());

  //ROUTER
  getIt.registerSingleton<AppRouter>(AppRouter(isAuth: CheckIsAuth()));

  // REPOSITORY
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
  getIt.registerLazySingleton<ProductFavouriteRepository>(
      () => ProductFavouriteRepositoryImpl());

  // SOURCE
  getIt.registerSingleton<ProductSource>(ProductSourceImpl(
    getIt.get<ProductRepository>(),
    getIt.get<ProductFavouriteRepository>(),
  ));

  // BLOC
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
  getIt.registerFactory<FavouriteBloc>(() => FavouriteBloc());
}

AppRouter appRouter() => getIt<AppRouter>();

// SOURCE
ProductSource productSource() => getIt.get<ProductSource>();

//SERVICE
AuthService authService() => getIt.get<AuthService>();

DynamicLinkService dynamicLinkService() => getIt<DynamicLinkService>();
