import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).popUntil((route) => false),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Error Title'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Error Message'),
        ),
      ),
    );
  }
}
