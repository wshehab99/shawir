import 'package:flutter/material.dart';

import 'custom_textfield.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
    required this.label,
    required this.delete,
    this.validator,
    this.controller,
  });
  final String label;
  final void Function()? delete;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 7),
          CustomTextField(
            prefixIcon: const Icon(Icons.alternate_email),
            suffixIcon: IconButton(
              onPressed: delete,
              icon: const Icon(Icons.delete),
            ),
            validator: validator,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
