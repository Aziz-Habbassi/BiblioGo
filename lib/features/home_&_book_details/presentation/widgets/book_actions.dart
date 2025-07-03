import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          ontap: () async {
            final Uri uri = Uri.parse(
              bookModel.volumeInfo!.canonicalVolumeLink ?? "",
            );
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          text: "Full book",
          textColor: Colors.deepPurpleAccent,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        CustomButton(
          ontap: () async {
            final Uri uri = Uri.parse(bookModel.volumeInfo!.previewLink ?? "");
            final ScaffoldMessengerState scaffoldMessenger =
                ScaffoldMessenger.of(context);
            if (await canLaunchUrl(uri) &&
                bookModel.accessInfo!.viewability != "NO_PAGES") {
              await launchUrl(uri);
            } else {
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  backgroundColor: Colors.deepPurpleAccent,
                  content: Text(
                    "Free Preview is not available",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
              );
            }
          },
          text: "Free Preview",
          textColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ],
    );
  }
}
