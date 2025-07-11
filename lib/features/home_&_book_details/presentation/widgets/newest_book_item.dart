import 'package:bibliogo/core/utils/app_router.dart';
import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_rating.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: GestureDetector(
        onTap: () {
          context.go(AppRouter.routebookdetailsview, extra: bookModel);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: SizedBox(
                height: 170,
                width: 110,
                child: CustomCachedImage(
                  imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? "",
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
                      bookModel.volumeInfo!.title ?? "title not available",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.style1,
                    ),
                  ),
                  Text(
                    bookModel.volumeInfo!.publisher ?? "Unknown Publisher",
                    style: Styles.style2.copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bookModel.volumeInfo!.language ?? "",
                        style: Styles.style2.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      BookRating(
                        avgRating: bookModel.volumeInfo!.averageRating,
                        ratingCount: bookModel.volumeInfo!.ratingsCount,
                      ),
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
