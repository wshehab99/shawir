import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.suffixIcon,
    this.initialValue,
    this.enabled,
    this.prefixIcon,
    this.onTap,
  });
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? enabled;
  final void Function()? onTap;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      initialValue: initialValue,
      enabled: enabled,
      onTap: onTap,
      style: Theme.of(context).inputDecorationTheme.counterStyle,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
      ),
    );
  }
}
