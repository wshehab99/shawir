import 'package:flutter/material.dart';
import 'package:shawir/resources/colors/app_colors.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    super.key,
    required this.icon,
    this.onPressed,
    this.height,
    this.width,
  });
  final Widget icon;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        // padding: const EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 0),
              color: AppColors.blackOpacity24,
            )
          ],
          color: AppColors.white,
        ),
        child: icon,
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBarIcons(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
