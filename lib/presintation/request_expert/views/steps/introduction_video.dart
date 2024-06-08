import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              controller.pickedVideo.value != null
                  ? PickedVideoWidget(
                      controller.pickedVideo.value!,
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
          );
        });
  }
}