import 'package:flutter/material.dart';

import '../../../resources/colors/app_colors.dart';

class DropCategory<T> extends StatelessWidget {
  const DropCategory({
    super.key,
    required this.onChanged,
    required this.items,
    this.value,
  });
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<T>(
        value: value,
        hint: const Text("choose value"),
        icon: const Icon(Icons.keyboard_arrow_right),
        elevation: 16,
        underline: Container(height: 0),
        isExpanded: true,
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
