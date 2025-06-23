import 'package:bibliogo/features/views/home_view/homes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(
        HomesView(),
        transition: Transition.native,
        duration: Duration(seconds: 1),
      );
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
            "assets/images/Animation.json",
            alignment: Alignment.center,
          ),
          SvgPicture.asset("assets/images/bibliogo_text_logo_dark_theme.svg"),
        ],
      ),
    );
  }
}
