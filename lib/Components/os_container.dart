// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class OsContainer extends StatefulWidget {
  final double height;
  final double width;
  final Widget icon;
  final String title;
  final String backText; // Added backText for the flipped side

  const OsContainer({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.title,
    required this.backText, // Required parameter for back text
  });

  @override
  _OsContainerState createState() => _OsContainerState();
}

class _OsContainerState extends State<OsContainer>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _onHover(bool hovering) {
    setState(() {
      isHovered = hovering;
      if (isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          // Check if the flipAnimation is past halfway
          bool isFront = _flipAnimation.value <= 0.5;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(
                _flipAnimation.value * 3.14159), // pi radians for flipping
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    Theme.of(context).colorScheme.primary.withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: isFront
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.icon,
                          const SizedBox(height: 12),
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(
                            3.14159), // Reverse the text's rotation
                        child: Center(
                          child: Text(
                            widget.backText,
                            style: TextStyle(
                              fontSize: height * 0.023,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
