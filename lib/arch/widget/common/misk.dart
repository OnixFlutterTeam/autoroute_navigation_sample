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
          splashColor: splashColor ?? Colors.lightBlue[100],
          highlightColor: splashColor ?? Colors.lightBlue[100],
          onTap: onTap,
          child: child,
        ),
      );
}
