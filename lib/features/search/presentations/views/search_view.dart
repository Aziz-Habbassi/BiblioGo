import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/best_seller_list_view.dart';
import 'package:bibliogo/features/search/presentations/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(child: SearchAppBar()),
                  Text(
                    "Search Result",
                    style: Styles.style1.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BestSellerListView(),
        ],
      ),
    );
  }
}
