import 'package:flutter/material.dart';

class UploadProgress extends StatelessWidget {
  const UploadProgress(this.value,{super.key});
  final double value;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(
        value: value,
      ),
    );
  }
}