import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final diameter = width * 3;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -(diameter * 0.25),
          right: -(width + diameter * 0.52),
          child: Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
