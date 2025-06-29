import 'package:bibliogo/core/utils/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());
  ThemeData themeData = darktheme;
  void changeTheme() {
    themeData == darktheme ? themeData = lighttheme : themeData = darktheme;
    emit(Themechanged());
  }
}
