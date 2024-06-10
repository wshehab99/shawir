import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/assets/assets_manager.dart';
import '../../../../resources/routing/routes.dart';
import '../../controllers/request_expert_controller.dart';
import '../../widgets/attatchment_widget.dart';

class AttachmentUpload extends StatelessWidget {
  const AttachmentUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AttatchmentWidget(
                label: 'Education Proofs',
                imagePath: AssetsManager.cv1,
                pickFile: controller.pickFileId,
                pickImage: controller.pickImageGaleryId,
                takeImage: controller.pickImageCameraId,
                route: Routes.educationProfs,
              ),
              const SizedBox(height: 15),
              AttatchmentWidget(
                label: 'Experience Certificates',
                imagePath: AssetsManager.cv2,
                pickFile: controller.pickFileCertificates,
                pickImage: controller.pickImageGaleryCertificates,
                takeImage: controller.pickImageCameraCertificates,
                route: Routes.experienceCertificates,
              ),
              const SizedBox(height: 15),
              AttatchmentWidget(
                label: 'Personal Photo & ID Proof',
                imagePath: AssetsManager.cv3,
                pickFile: controller.pickFilePersonal,
                pickImage: controller.pickImageGaleryPersonal,
                takeImage: controller.pickImageCameraPersonal,
                route: Routes.photoId,
              ),
            ],
          );
        });
  }
}
