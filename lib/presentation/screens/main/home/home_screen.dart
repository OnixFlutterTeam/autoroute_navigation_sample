import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeBloc>(),
      child: _buildScaffold(context),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      routes: const [
        ProductsRouter(),
        FavouritesRoute(),
        InfoRoute(),
      ],
      builder: (context, child, animation) {
        return SafeArea(child: child);
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.deepPurpleAccent[200],
              icon: const Icon(
                Icons.list_outlined,
                size: 30,
              ),
              title: const Text('Products'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.deepPurpleAccent[200],
              icon: const Icon(
                Icons.favorite_outline,
                size: 30,
              ),
              title: const Text('Favourites'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.deepPurpleAccent[200],
              icon: const Icon(
                Icons.info_outline,
                size: 30,
              ),
              title: const Text('Info'),
            ),
          ],
        );
      },
    );
  }
}
