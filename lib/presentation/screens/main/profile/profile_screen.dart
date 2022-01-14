import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('profile screen'),
              const Delimiter.height(16),
              DefaultButton(
                title: 'logOut -> nav to sign in',
                onTap: () {
                  authService().logOut();
                  context.router.replaceAll([
                    const SplashRoute(),
                    const AuthRouter(),
                  ]);
                  //DOING THE SAME
                  // context.replaceRoute(const SplashRoute());
                  // context.pushRoute(const AuthRouter());
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'nav to settings',
                onTap: () {
                  context.navigateTo(const SettingsRoute());
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'nav to main',
                onTap: () {
                  context.router.root.replaceAll([const MainRoute()]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
