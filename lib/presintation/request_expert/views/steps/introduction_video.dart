import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shawir/presintation/request_expert/widgets/compress_progress.dart';
import 'package:shawir/presintation/request_expert/widgets/upload_progress.dart';

import '../../controllers/request_expert_controller.dart';
import '../../widgets/picked_video_widget.dart';
import '../../widgets/step_controller_button.dart';

class IntroductionVideo extends StatelessWidget {
  const IntroductionVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.isCompress.value
                ? const CompressProgress()
                : controller.videLoad.value
                    ? UploadProgress(controller.progress.value)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controller.video.value != null
                              ? PickedVideoWidget(
                                  controller.video.value!,
                                  delete: controller.deleteVideo,
                                )
                              : Row(
                                  children: [
                                    StepControllerButton(
                                      text: "Pick Video",
                                      onPressed: controller.pickVideo,
                                    ),
                                  ],
                                ),
                        ],
                      ),
          );
        });
  }
}
