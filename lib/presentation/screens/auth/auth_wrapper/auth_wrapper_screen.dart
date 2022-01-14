import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoginWrapperScreen extends StatefulWidget {
  const LoginWrapperScreen({Key? key}) : super(key: key);

  @override
  _LoginWrapperPageState createState() => _LoginWrapperPageState();
}

// There we can add main bloc for auth flow
class _LoginWrapperPageState extends State<LoginWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}
