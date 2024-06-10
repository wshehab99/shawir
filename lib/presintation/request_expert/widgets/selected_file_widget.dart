import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shawir/domain/models/document.dart';

class SelectedFileWidget extends StatelessWidget {
  const SelectedFileWidget(this.file, {super.key, this.remove});
  final Document file;
  final void Function()? remove;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          GetUtils.isImage(file.documentUri)
              ? Image.network(
                  file.uriFormatted,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.picture_as_pdf),
          Positioned(
            top: 3,
            left: 3,
            child: InkWell(
              onTap: remove,
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
