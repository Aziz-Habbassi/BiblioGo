import 'package:bibliogo/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.go(AppRouter.routehomeview);
        },
        icon: Icon(Icons.close, size: 32),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart, size: 32)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
