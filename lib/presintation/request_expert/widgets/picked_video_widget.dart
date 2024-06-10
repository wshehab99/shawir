import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/models/document.dart';

class PickedVideoWidget extends StatefulWidget {
  const PickedVideoWidget(this.file, {super.key, this.delete});
  final Document file;
  final void Function()? delete;
  @override
  State<PickedVideoWidget> createState() => _PickedVideoWidgetState();
}

class _PickedVideoWidgetState extends State<PickedVideoWidget> {
  late VideoPlayerController _controller;

  void initVideo() async {
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.file.uriFormatted))
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void initState() {
    initVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return widget.file != null
        ? Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
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
