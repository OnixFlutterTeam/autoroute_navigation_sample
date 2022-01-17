import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/common/toast.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              const Text('Sign in screen'),
              const Delimiter.height(16),
              DefaultButton(
                title: 'Make auto sign in -> navigate to main screen',
                onTap: () async {
                  authService().login('some_email@some.com', 'some_password');
                  CustomToast.showToast(
                    'signed in with credentials: some_email@some.com/some_password',
                    toastLength: Toast.LENGTH_SHORT,
                  );
                  await Future.delayed(const Duration(seconds: 1));
                  context.router.root.replaceAll([const MainRouter()]);
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'Try to navigate to main screen (without sign in)',
                onTap: () {
                  context.router.root.replaceAll([const MainRouter()]);
                },
              ),
              const Delimiter.height(16),
              DefaultButton(
                title: 'Navigate to sign up screen',
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
