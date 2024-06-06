import 'package:flutter/material.dart';

import '../../../app/support/helpers.dart';
import '../../../resources/colors/app_colors.dart';
import 'step_controller_button.dart';

class AttatchmentWidget extends StatelessWidget {
  const AttatchmentWidget({
    super.key,
    required this.label,
    required this.imagePath,
    required this.route,
    required this.pickFile,
    required this.pickImage,
    required this.takeImage,
  });
  final String label;
  final String imagePath;
  final String route;
  final void Function() pickImage;
  final void Function() takeImage;
  final void Function() pickFile;
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
              const Padding(
                padding: EdgeInsets.all(8.0),
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
                    onPressed: () => showPickFileBottomSheet(
                      context,
                      pickFile: () async {
                        pickFile();
                        // Navigator.pushNamed(context, route);
                      },
                      pickImage: () async {
                        pickImage();
                        // Navigator.pushNamed(context, route);
                      },
                      takeImage: () async {
                        takeImage();
                        // Navigator.pushNamed(context, route);
                      },
                    ),
                    text: "Add Profe",
                    height: 40,
                  ),
                  StepControllerButton(
                    onPressed: () => Navigator.pushNamed(context, route),
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

class AttatchmenIconWidgettWidget extends StatelessWidget {
  const AttatchmenIconWidgettWidget({
    super.key,
    this.color = Colors.purple,
    required this.icon,
    this.onTap,
    required this.txt,
  });
  final Color color;
  final IconData icon;
  final void Function()? onTap;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: InkWell(
            onTap: onTap,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        Text(txt),
      ],
    );
  }
}
