import 'dart:io';

import 'package:flutter/material.dart';

import 'app_bar_icons.dart';

class SelectImageWidget extends StatelessWidget {
  const SelectImageWidget({super.key, this.image, this.pick});
  final String? image;
  final void Function()? pick;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 111,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: image != null
              ? Image.file(
                  File(image!),
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.image),
        ),
        PositionedDirectional(
          bottom: -6,
          end: -6,
          child: AppBarIcons(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: pick,
            height: 36,
            width: 36,
          ),
        )
      ],
    );
  }
}
