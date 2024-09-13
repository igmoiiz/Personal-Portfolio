import 'package:e_portfolio/Views/Responsive%20Layout/layout.dart';
import 'package:e_portfolio/Views/Theme/theme.dart';
import 'package:e_portfolio/Views/desktop_layout.dart';
import 'package:e_portfolio/Views/mobile_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode,
      home: const ResponsiveLayout(
        mobileLayout: MobileScaffold(),
        desktopLayout: DesktopScaffold(),
      ),
    );
  }
}
