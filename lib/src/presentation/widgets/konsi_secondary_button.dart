import 'package:flutter/material.dart';

class KonsiSecondaryButton extends MaterialButton {
  const KonsiSecondaryButton({
    required super.onPressed,
    required Widget child,
    EdgeInsetsGeometry? padding,
    super.key,
  }) : super(
          color: Colors.transparent,
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
          textColor: Colors.green,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.green,
            ),
          ),
          child: child,
        );
}
