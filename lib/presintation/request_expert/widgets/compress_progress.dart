import 'package:flutter/material.dart';
import 'package:video_compress/video_compress.dart';

class CompressProgress extends StatefulWidget {
  const CompressProgress({super.key});

  @override
  State<CompressProgress> createState() => _CompressProgressState();
}

class _CompressProgressState extends State<CompressProgress> {
  late Subscription _subscription;
  double compressProgress = 0.0;
  @override
  void initState() {
    _subscription = VideoCompress.compressProgress$
        .subscribe((value) => setState(() => compressProgress = value));
    super.initState();
  }

  @override
  void dispose() {
    VideoCompress.cancelCompression();
    _subscription.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: compressProgress / 100,
        ),
        Text("compress video"),
      ],
    );
  }
}
