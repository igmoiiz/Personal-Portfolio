// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final mobileLayout;
  final desktopLayout;
  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
