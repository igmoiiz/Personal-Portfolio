import 'dart:math';

import 'package:flutter/material.dart';

class OsContainer extends StatefulWidget {
  final double height;
  final double width;
  final Widget icon;
  final String title;
  final String backText; // New field for back text

  const OsContainer({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.title,
    required this.backText, // Pass back text
  });

  @override
  State<OsContainer> createState() => _OsContainerState();
}

class _OsContainerState extends State<OsContainer>
    with TickerProviderStateMixin {
  bool _isFront = true; // Track the current side (front/back)
  late final AnimationController
      _controller; // Use 'late' for non-null initialization
  late final Animation<double>
      _flipAnimation; // Declare flipAnimation as a class field

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Adjust animation duration
    );

    // Initialize _flipAnimation here after _controller is initialized
    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isFront = !_isFront;
          _controller.forward();
        });
      },
      onExit: (event) {
        setState(() {
          _isFront = !_isFront;
          _controller.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateY(pi * _flipAnimation.value),
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _isFront
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.icon,
                        const SizedBox(height: 12),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: widget.height * 0.1,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.identity(), // No rotation for back text
                      child: Text(
                        widget.backText,
                        style: TextStyle(
                          fontSize: widget.height * 0.12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
