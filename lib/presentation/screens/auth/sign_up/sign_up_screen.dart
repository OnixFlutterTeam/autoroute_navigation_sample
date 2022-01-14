import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/logger.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/common/toast.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "";

  @override
  Widget build(context) => AutoRouter.declarative(routes: (_) {
        return [
          EmailRoute(onNext: (result) {
            setState(() {
              email = result;
            });
          }),
          if (email.isNotEmpty)
            PasswordRoute(onNext: (password) async {
              final result = await validateEmailAndPassword(email, password);
              if (result) {
                context.router.replaceAll([const MainRouter()]);
              }
            }),
        ];
      });

  Future<bool> validateEmailAndPassword(
    String email,
    String password,
  ) async {
    Logger.log('email: $email, password: $password');
    CustomToast.showToast('email: $email, password: $password');
    authService().completeSignUp(email, password);
    await Future.delayed(const Duration(milliseconds: 1000));
    return true;
  }
}
