import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Notification Settings',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
