import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_school/src/core/presentation/sizes.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({this.message = 'جاري التحميل...', super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            Flexible(
              child: Text(message, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

void showLoadingDialog(
  BuildContext context, {
  String message = 'جاري التحميل...',
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(message: message),
  );
}

Future<void> showAlertDialog(
  BuildContext context,
  String message, {
  bool dismissible = true,
  String okMessage = 'خسنا',
  VoidCallback? onOk,
}) async {
  await showDialog(
    barrierDismissible: dismissible,
    context: context,
    builder: (context) => AlertDialog(
      content: Text(message, style: TextStyle(fontSize: Sizes.s16)),
      actions: [
        TextButton(
          onPressed: () {
            if (onOk != null) {
              onOk();
            }
            context.pop();
          },
          child: Text(okMessage),
        ),
      ],
    ),
  );
}
