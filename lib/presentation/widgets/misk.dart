import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.onTap,
    this.title = '',
    this.color = Colors.white,
  }) : super(key: key);

  final Color color;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(color),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}
