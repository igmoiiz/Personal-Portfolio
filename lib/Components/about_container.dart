// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AboutContainer extends StatelessWidget {
  final text;
  const AboutContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue.shade900,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 7,
            spreadRadius: 3.5,
            color: Colors.blue.shade900.withOpacity(0.3),
          ),
          BoxShadow(
            offset: const Offset(-2, -2),
            blurRadius: 7,
            spreadRadius: 3.5,
            color: Colors.blue.shade900.withOpacity(0.5),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: .5,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
