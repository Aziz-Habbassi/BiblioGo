import 'package:bibliogo/features/views/home_view/widgets/covers_list_view.dart';
import 'package:bibliogo/features/views/home_view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: CoversListView());
  }
}
