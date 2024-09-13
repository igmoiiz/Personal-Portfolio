// ignore_for_file: must_be_immutable

import 'package:e_portfolio/Components/launch_button.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final text;
  VoidCallback onTap;
  InfoContainer({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: height * 0.06),
              LaunchButton(
                text: 'GitHub',
                onTap: onTap,
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
