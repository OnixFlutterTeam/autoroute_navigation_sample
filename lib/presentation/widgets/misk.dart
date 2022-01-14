import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Delimiter extends SizedBox {
  const Delimiter.height(double h, {Key? key}) : super(key: key, height: h);

  const Delimiter.width(double w, {Key? key}) : super(key: key, width: w);
}

class ClickableWidget extends StatelessWidget {
  ClickableWidget({
    required this.child,
    required this.onTap,
    this.color = Colors.transparent,
    this.splashColor,
    this.borderRadius,
    this.borderRadiusInk,
    this.elevation = 0,
  });

  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final Color? splashColor;
  final double elevation;
  final BorderRadiusGeometry? borderRadius;
  final BorderRadius? borderRadiusInk;

  @override
  Widget build(BuildContext context) => Material(
        color: color,
        elevation: elevation,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadiusInk ?? BorderRadius.circular(10.0),
          splashColor: splashColor ?? Colors.lightBlue[50],
          highlightColor: splashColor ?? Colors.lightBlue[50],
          onTap: onTap,
          child: child,
        ),
      );
}

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
