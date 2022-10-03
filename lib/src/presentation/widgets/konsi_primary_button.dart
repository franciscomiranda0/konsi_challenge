import 'package:flutter/material.dart';

class KonsiPrimaryButton extends MaterialButton {
  const KonsiPrimaryButton({
    required super.onPressed,
    required super.child,
    super.key,
  }) : super(
          color: Colors.green,
          elevation: 0,
          textColor: Colors.black54,
        );
}
