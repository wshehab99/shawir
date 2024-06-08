import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_compress/video_compress.dart';

class PickedVideoWidget extends StatefulWidget {
  const PickedVideoWidget(this.file, {super.key, this.delete});
  final File file;
  final void Function()? delete;
  @override
  State<PickedVideoWidget> createState() => _PickedVideoWidgetState();
}

class _PickedVideoWidgetState extends State<PickedVideoWidget> {
  dynamic thumb;
  void gitThumbnail() async {
    thumb = await VideoCompress.getByteThumbnail(widget.file.path);
    setState(() {});
  }

  @override
  void initState() {
    gitThumbnail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return thumb != null
        ? Stack(
            alignment: Alignment.center,
            children: [
              Image.memory(
                thumb,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
              const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
              Positioned(
                top: 3,
                left: 3,
                child: InkWell(
                  onTap: widget.delete,
                  child: const Icon(Icons.close),
                ),
              )
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
