import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/features/views/home_view/widgets/best_seller_list_view.dart';
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoversListView(),
                Text(
                  "Best Seller",
                  style: Styles.style1.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),

          BestSellerListView(),
        ],
      ),
    );
  }
}
