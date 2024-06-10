import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SizedSvg extends StatelessWidget {
  const SizedSvg(this.path, {super.key, this.color, this.dimension});
  final String path;
  final double? dimension;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension ?? 25,
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          color ?? Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
