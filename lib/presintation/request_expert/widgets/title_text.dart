import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.title, {super.key, this.isShown = false});
  final String title;
  final bool isShown;
  @override
  Widget build(BuildContext context) {
    return isShown
        ? SizedBox(
            width: MediaQuery.of(context).size.width / 3.5,
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          )
        : const SizedBox();
  }
}
