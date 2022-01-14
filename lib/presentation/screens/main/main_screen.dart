import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/common/will_pop_dialog.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => WillPopDialog.onTryCloseApp(context),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('MAIN'),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'nav to home',
                  onTap: () {
                    context.navigateTo(const HomeRoute());
                  },
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'nav to profile',
                  onTap: () {
                    context.navigateTo(const ProfileRoute());
                  },
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'nav to splash',
                  onTap: () {
                    context.replaceRoute(const SplashRoute());
                  },
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'nav to add product item',
                  onTap: () {
                    context.navigateTo(
                      const HomeRoute(children: [
                        ProductsRouter(children: [
                          ProductListRouter(),
                          AddProductRoute(),
                        ])
                      ]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
