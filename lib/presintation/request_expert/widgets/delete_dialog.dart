import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          Text(message),
          ElevatedButton(onPressed: submit, child: Text("Continue")),
          ElevatedButton(onPressed: submit, child: Text("Cancel")),
        ],
      ),
    );
  }
}
