import 'package:flutter/material.dart';

class KonsiPrimaryButton extends MaterialButton {
  const KonsiPrimaryButton({
    required super.onPressed,
    required Widget child,
    EdgeInsetsGeometry? padding,
    bool showLoadIndicator = false,
    super.key,
  }) : super(
          color: Colors.green,
          elevation: 0,
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
