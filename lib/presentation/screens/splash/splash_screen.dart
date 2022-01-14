import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/logger.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/common/toast.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';

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
                  title: 'nav to main',
                  onTap: () {
                    context.replaceRoute(const MainRouter());
                  },
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'nav to auth',
                  onTap: () {
                    context.replaceRoute(const AuthRouter());
                  },
                ),
                const Delimiter.height(16),
                DefaultButton(
                  title: 'Create DL settings',
                  onTap: () async {
                    final url =
                        await dynamicLinkService().createDynamicLink(true);
                    Logger.log('url: $url');
                    CustomToast.showToast(url);
                  },
                ),
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
}
