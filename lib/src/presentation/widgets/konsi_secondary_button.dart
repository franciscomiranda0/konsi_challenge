import 'package:flutter/material.dart';

class KonsiSecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showLoadIndicator;

  const KonsiSecondaryButton({
    required this.onPressed,
    required this.child,
    this.showLoadIndicator = false,
    this.padding,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.transparent,
      elevation: 0,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      textColor: ThemeData.from(colorScheme: Theme.of(context).colorScheme)
          .primaryColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ThemeData.from(colorScheme: Theme.of(context).colorScheme)
              .primaryColor,
        ),
      ),
      child: child,
    );
  }
}
