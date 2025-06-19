import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            fit: BoxFit.cover,
            "assets/images/Animation.json",
            alignment: Alignment.center,
          ),
          SvgPicture.asset("assets/images/bibliogo_text_logo_dark_theme.svg"),
        ],
      ),
    );
  }
}
