import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';

class Compressor {
  Future<MediaInfo?> compressVideo(String path) => VideoCompress.compressVideo(
        path,
        quality: VideoQuality.DefaultQuality,
        deleteOrigin: true,
        includeAudio: true,
      );
  Future<XFile?> compressImage(XFile file) =>
      FlutterImageCompress.compressAndGetFile(
        File(file.path).absolute.path,
        _targetPath(file),
        quality: 88,
        // format: CompressFormat.jpeg,
      );

  String _targetPath(XFile file) {
    var list = file.path.split('/');
    return "${list.sublist(0, list.length - 1).join('/')}/COMP.jpeg";
  }
}
