import 'package:bibliogo/core/utils/assets.dart';
import 'package:bibliogo/features/views/home_view/widgets/covers_list_view.dart';
import 'package:bibliogo/features/views/home_view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CoversListView()),
          SliverToBoxAdapter(
            child: Text(
              "Best Seller",
              style: TextStyle(
                fontFamily: "SectraFine",
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(cover, height: 200),
                  Column(
                    children: [
                      Text(
                        "Harry Potter and the goblet of Fire",
                        style: TextStyle(
                          fontFamily: "SectraFine",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text("J.k Rowing"),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
