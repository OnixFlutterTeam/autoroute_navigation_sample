import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
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
              const Text('Profile screen'),
              const Delimiter.height(16),
              DefaultButton(
                title: 'LogOut -> navigate to sign in screen',
                onTap: () {
                  authService().logOut();
                  context.router.replaceAll([
                    const SplashRoute(),
                    const AuthRouter(),
                  ]);
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'Navigate to settings screen',
                onTap: () {
                  context.navigateTo(const SettingsRoute());
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'Navigate to main screen',
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
