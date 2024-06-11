import 'package:flutter/material.dart';
import 'package:shawir/resources/colors/app_colors.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.submit,
    required this.message,
  });
  final void Function() submit;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(message),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      submit();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Continue",
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                const SizedBox(
                  width: 3,
                ),
                ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppColors.borderOpacity80),
                            ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
