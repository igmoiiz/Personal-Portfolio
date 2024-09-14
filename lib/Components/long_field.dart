// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LongFormField extends StatelessWidget {
  String hint;
  String validatorHint;
  TextEditingController controller;
  TextInputType inputType;
  LongFormField({
    super.key,
    required this.controller,
    required this.validatorHint,
    required this.hint,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      style: TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
      ),
      maxLines: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorHint;
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
