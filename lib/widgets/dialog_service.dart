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

  static void showDialogSuccess(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 40,
                ),
                Text(title),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showDialogFail(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 40,
                ),
                Text(title),
              ],
            ),
          ),
        );
      },
    );
  }
}
