import 'package:bibliogo/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String id = "Splashview";
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(AppRouter.routehomeview);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            fit: BoxFit.cover,
            "assets/animations/Animation.json",
            alignment: Alignment.center,
          ),
          SvgPicture.asset("assets/images/bibliogo_text_logo_dark_theme.svg"),
        ],
      ),
    );
  }
}
