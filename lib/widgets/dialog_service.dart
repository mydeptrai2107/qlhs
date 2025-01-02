import 'package:flutter/material.dart';

class DialogService {
  static void showLoading(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(50),
          ),
          child: Center(child: const CircularProgressIndicator()),
        );
      },
    );
  }
}
