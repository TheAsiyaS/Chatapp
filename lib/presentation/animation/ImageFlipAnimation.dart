import 'package:flutter/material.dart';

import 'dart:math' as math;

class ImageFlip extends StatefulWidget {
  const ImageFlip({super.key});

  @override
  ImageFlipState createState() => ImageFlipState();
}

class ImageFlipState extends State<ImageFlip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation automatically on screen load
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    await _controller.forward();
    setState(() {
      isFront = !isFront;
    });
    await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final angle = _animation.value * math.pi;
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // perspective
            ..rotateY(angle),
          alignment: Alignment.center,
          child: isFront
              ? _buildFrontAvatar('asset/Logo.png', true)
              : Transform(
                  transform: Matrix4.identity(),
                  alignment: Alignment.center,
                  child: _buildFrontAvatar("asset/Logo.png", true),
                ),
        );
      },
    );
  }

  Widget _buildFrontAvatar(String photoUrl, bool isasset) {
    return CircleAvatar(
      radius: 70,
      backgroundImage: isasset ? AssetImage(photoUrl) : NetworkImage(photoUrl),
    );
  }
}
