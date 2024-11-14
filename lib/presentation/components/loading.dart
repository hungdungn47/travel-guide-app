import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  final double width;
  final double height;
  const LoadingAnimation({super.key, this.width = 450, this.height = 450});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animation/animation.json',
        width: width,
        height: height,
      ),
    );
  }
}
