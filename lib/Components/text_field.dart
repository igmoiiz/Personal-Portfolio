// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String hint;
  String validatorHint;
  TextEditingController controller;
  TextInputType inputType;
  IconData icon;
  CustomFormField({
    super.key,
    required this.controller,
    required this.icon,
    required this.validatorHint,
    required this.hint,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: true,
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorHint;
        } else {
          return null;
        }
      },
      style: TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
      ),
      controller: controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: hint,
        hintTextDirection: TextDirection.ltr,
        hintFadeDuration: const Duration(milliseconds: 150),
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 10,
        ),
      ),
    );
  }
}
