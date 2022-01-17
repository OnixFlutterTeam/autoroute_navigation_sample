import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/common/toast.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  Timer? _timer;
  bool _isReadyToLaunch = false;
  bool _isReadyTimer = false;

  @override
  void initState() {
    _initSettings();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (_isReadyToLaunch) {
              _timer?.cancel();
              _isReadyTimer = true;
            }
            _navNext();
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 260,
                    height: 120,
                    child: Placeholder(),
                  ),
                ),
                const Delimiter.height(16),
                const Text('Splash screen'),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'Navigate to main screen',
                  onTap: () {
                    context.replaceRoute(const MainRouter());
                  },
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'Navigate to auth screen flow',
                  onTap: () {
                    context.replaceRoute(const AuthRouter());
                  },
                ),
                const Delimiter.height(16),
                Platform.isAndroid
                    ? DefaultButton(
                        title: 'Create dynamic deep link to settings screen',
                        onTap: () async {
                          final url = await dynamicLinkService()
                              .createDynamicLink(true);
                          _showSnackBar(context, url);
                        },
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _timer = Timer(
      const Duration(seconds: 2),
      () {
        _isReadyTimer = true;
        _navNext();
      },
    );
  }

  Future<void> _navNext() async {
    if (_isReadyToLaunch && _isReadyTimer) {
      _timer?.cancel();
      //ADD LOGIC TO OPEN NEXT SCREEN
    }
  }

  void _initSettings() async {
    _isReadyToLaunch = true;
    _navNext();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text('Paste the link into the browser\n$message'),
      action: SnackBarAction(
        label: 'Copy link',
        onPressed: () {
          Clipboard.setData(ClipboardData(text: message));
          CustomToast.showToast('Copied');
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
