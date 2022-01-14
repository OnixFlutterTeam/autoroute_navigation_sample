import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  final Function(String email) onNext;

  final _textController = TextEditingController(text: 'some_email@some.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Email screen'),
                const Delimiter.height(16),
                TextField(
                  controller: _textController,
                  maxLines: 1,
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'enter email',
                  onTap: () {
                    onNext(_textController.text);
                  },
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'nav to sign up',
                  onTap: () {
                    context.navigateTo(const SignInRoute());
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
