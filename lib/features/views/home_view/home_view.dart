import 'package:bibliogo/core/cubits/cubit/change_theme_cubit.dart';
import 'package:bibliogo/core/utils/assets.dart';
import 'package:bibliogo/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            BlocProvider.of<ChangeThemeCubit>(context).themeData == lighttheme
            ? SvgPicture.asset(lightlogo)
            : SvgPicture.asset(darklogo),

        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<ChangeThemeCubit>(context).changeTheme();
            },
            icon: Icon(Icons.sunny),
          ),
        ],
      ),
    );
  }
}
