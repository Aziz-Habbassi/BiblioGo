import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/best_seller_list_view.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/covers_list_view.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoversListView(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: Text(
                    "Newest",
                    style: Styles.style1.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          BestSellerListView(),
        ],
      ),
    );
  }
}
