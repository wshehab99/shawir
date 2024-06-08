import 'package:flutter/material.dart';

import '../../../resources/colors/app_colors.dart';

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({
    super.key,
    required this.label,
    this.selected,
  });
  final String? selected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.border,
              ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.border, width: 2),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selected ?? "",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ],
    );
  }
}
