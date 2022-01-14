import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('sign in screen'),
              const Delimiter.height(16),
              DefaultButton(
                title: 'sign in -> nav to main',
                onTap: () {
                  authService().login('some_email@some.com', 'some_password');
                  context.router.root.replaceAll([const MainRouter()]);
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'try nav to main (without login)',
                onTap: () {
                  context.router.root.replaceAll([const MainRouter()]);
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'nav to sign up',
                onTap: () {
                  context.navigateTo(const SignUpRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
