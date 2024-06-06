import 'package:flutter/material.dart';

import '../../presintation/request_expert/widgets/attatchment_widget.dart';
import '../../resources/colors/app_colors.dart';

showPickFileBottomSheet(
  BuildContext context, {
  void Function()? pickImage,
  void Function()? takeImage,
  void Function()? pickFile,
}) =>
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AttatchmenIconWidgettWidget(
                icon: Icons.image,
                onTap: pickImage,
                txt: 'Gallery',
              ),
              AttatchmenIconWidgettWidget(
                icon: Icons.photo_camera,
                color: Colors.pink,
                onTap: takeImage,
                txt: 'Camera',
              ),
              AttatchmenIconWidgettWidget(
                icon: Icons.file_present_rounded,
                color: AppColors.appBarTitle,
                onTap: pickFile,
                txt: 'Document',
              ),
            ],
          ),
        ),
      ),
    );
