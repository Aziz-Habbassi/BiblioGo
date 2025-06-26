import 'package:bibliogo/core/cubits/cubit/change_theme_cubit.dart';
import 'package:bibliogo/core/utils/assets.dart';
import 'package:bibliogo/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return BlocProvider.of<ChangeThemeCubit>(context).themeData ==
                  lighttheme
              ? SvgPicture.asset(lightlogo)
              : SvgPicture.asset(darklogo);
        },
      ),

      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            BlocProvider.of<ChangeThemeCubit>(context).changeTheme();
          },
          icon: Icon(Icons.sunny, size: 32),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
