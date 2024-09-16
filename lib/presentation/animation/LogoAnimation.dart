import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({super.key});

  @override
  _AnimationLogoState createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with TickerProviderStateMixin {
  // Using TickerProviderStateMixin to manage multiple AnimationControllers
  late AnimationController _textController;
  late AnimationController _circleController;
  late Animation<double> _textAnimation;
  late Animation<double> _circleAnimation;
  String textToReveal = "THE WINGS";

  @override
  void initState() {
    super.initState();

    // AnimationController for the text
    _textController = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );

    // Animation for text opacity
    _textAnimation =
        Tween<double>(begin: 0.6, end: -.8).animate(_textController)
          ..addListener(() {
            setState(() {});
          });

    // AnimationController for the CircleAvatar
    _circleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Animation for CircleAvatar movement
    _circleAnimation =
        Tween<double>(begin: .5, end: -.8).animate(_circleController)
          ..addListener(() {
            setState(() {});
          });

    // Start both animations
    _textController.forward();
    _circleController.forward();
  }

  @override
  void dispose() {
    _textController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: Stack(
        children: [
          // Stationary Container with the text
          Center(
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: textToReveal.split('').asMap().entries.map((entry) {
                  int index = entry.key;
                  String letter = entry.value;

                  return AnimatedOpacity(
                    // Adjust the condition for full text reveal
                    opacity: _textAnimation.value <
                            ((1.0 / textToReveal.length) * (index + 1))
                        ? 1.0
                        : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      letter,
                      style: GoogleFonts.lora(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Moving CircleAvatar
          Align(
            alignment: Alignment(
                _circleAnimation.value, 0.0), // Adjust the vertical position
            child: const CircleAvatar(
              backgroundImage: AssetImage('asset/Logo.png'),
              radius: 25,
            ),
          ),
        ],
      ),
    );
  }
}
