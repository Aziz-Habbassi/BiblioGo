import 'package:bibliogo/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      checkCategory();
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

  Future<void> checkCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? category = prefs.getString("category");
    if (!mounted) return;
    if (category == null) {
      context.go(AppRouter.routecategoryselection);
    } else {
      context.go(AppRouter.routehomeview);
    }
  }
}
