import 'package:flutter/material.dart';

import '../../../resources/colors/app_colors.dart';
import 'attatchment_widget.dart';

class PickFileBottomSheet extends StatelessWidget {
  const PickFileBottomSheet({
    super.key,
    this.pickFile,
    this.takeImage,
    this.pickImage,
  });
  final void Function()? pickImage;
  final void Function()? takeImage;
  final Function()? pickFile;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
