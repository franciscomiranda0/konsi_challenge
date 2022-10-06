import 'package:flutter/material.dart';

class KonsiPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showLoadIndicator;

  const KonsiPrimaryButton({
    required this.onPressed,
    required this.child,
    this.padding,
    this.showLoadIndicator = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: ThemeData.from(colorScheme: Theme.of(context).colorScheme)
          .primaryColor,
      elevation: 0,
      onPressed: onPressed,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      textColor: Colors.black54,
      child: showLoadIndicator
          ? const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: Colors.white70,
                strokeWidth: 2,
              ),
            )
          : child,
    );
  }
}
