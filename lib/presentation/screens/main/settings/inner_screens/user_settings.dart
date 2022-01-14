import 'package:flutter/material.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'User Settings',
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
