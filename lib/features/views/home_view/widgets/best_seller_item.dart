import 'package:bibliogo/core/utils/app_router.dart';
import 'package:bibliogo/core/utils/assets.dart';
import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/features/views/home_view/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: GestureDetector(
        onTap: () {
          context.go(AppRouter.routebookdetailsview);
        },
        child: Row(
          children: [
            Container(
              height: 170,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(cover),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Harry Potter and the goblet of Fire ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.style1,
                    ),
                  ),
                  Text(
                    "J.k Rowing",
                    style: Styles.style2.copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"19.99$",
                        style: Styles.style2.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
