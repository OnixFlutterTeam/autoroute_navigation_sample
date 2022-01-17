import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String currentName = NotificationSettingsRoute.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Delimiter.height(16),
            const Text('Settings screen'),
            const Delimiter.height(16),
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _navLink(
                          label: 'Notification',
                          destination: const NotificationSettingsRoute(),
                          context: context,
                        ),
                        _navLink(
                          label: 'Other',
                          destination: const OtherSettingsRoute(),
                          context: context,
                        ),
                        _navLink(
                          label: 'User',
                          destination: const UserSettingsRoute(),
                          context: context,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      color: Colors.lightBlue[50],
                      child: const AutoRouter(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navLink({
    required String label,
    required PageRouteInfo destination,
    required BuildContext context,
  }) {
    return ClickableWidget(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentName == destination.routeName
              ? Colors.lightBlue[50]
              : Colors.transparent,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(label),
      ),
      onTap: () {
        setState(() {
          currentName = destination.routeName;
        });
        context.replaceRoute(destination);
      },
    );
  }
}
