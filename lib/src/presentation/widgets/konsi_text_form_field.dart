import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KonsiTextFormField extends TextFormField {
  // final TextEditingController controller;
  // final String hint;
  // final List<TextInputFormatter> inputFormatters;
  // final String? Function(String?) validator;
  // final Key formKey;

  KonsiTextFormField({
    required TextEditingController controller,
    required String hint,
    required List<TextInputFormatter> inputFormatters,
    required String? Function(String?) validator,
    required TextInputType keyboardType,
    Key? key,
  }) : super(
          key: key,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            fillColor: Colors.black12,
            filled: true,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black45),
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textAlign: TextAlign.center,
          validator: validator,
        );

  // @override
  // Widget build(BuildContext context) {
  //   return TextFormField(
  //     key: formKey,
  //     controller: controller,
  //     cursorColor: Colors.green,
  //     decoration: InputDecoration(
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 8),
  //       fillColor: Colors.black12,
  //       filled: true,
  //       hintText: hint,
  //       hintStyle: const TextStyle(color: Colors.black45),
  //     ),
  //     inputFormatters: inputFormatters,
  //     keyboardType: TextInputType.number,
  //     textAlign: TextAlign.center,
  //     validator: validator,
  //   );
  // }
}
