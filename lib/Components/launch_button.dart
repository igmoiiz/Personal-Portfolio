// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LaunchButton extends StatelessWidget {
  final text;
  final VoidCallback onTap;
  const LaunchButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.1,
        width: width * 0.2,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.blue.shade400,
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
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                text,
                speed: const Duration(milliseconds: 300),
                textAlign: TextAlign.justify,
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 18,
                  letterSpacing: .5,
                  fontFamily: 'BaskervvilleSC',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
