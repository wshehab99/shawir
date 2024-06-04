import 'package:flutter/material.dart';

import '../../../resources/colors/app_colors.dart';
import 'step_controller_button.dart';

class AttatchmentWidget extends StatelessWidget {
  const AttatchmentWidget({
    super.key,
    required this.label,
    required this.imagePath,
  });
  final String label;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2.5,
              color: AppColors.appBarTitle,
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 25,
                      color: AppColors.border,
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  StepControllerButton(
                    onPressed: () {},
                    text: "Add Profe",
                    height: 40,
                  ),
                  StepControllerButton(
                    onPressed: () {},
                    text: "Edit Profe",
                    height: 40,
                    color: AppColors.border,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
