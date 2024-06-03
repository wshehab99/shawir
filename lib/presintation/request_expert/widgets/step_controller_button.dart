import 'package:flutter/material.dart';

class StepControllerButton extends StatelessWidget {
  const StepControllerButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.color,
  });

  final String text;
  final double? height;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(color)),
          onPressed: onPressed,
          child: SizedBox(
            height: height ?? 60,
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
