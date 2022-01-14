import 'package:flutter/material.dart';

class OtherSettingsScreen extends StatelessWidget {
  const OtherSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Other Settings',
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
