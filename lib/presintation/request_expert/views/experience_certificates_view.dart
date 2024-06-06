import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/support/helpers.dart';
import '../controllers/request_expert_controller.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/selected_file_widget.dart';

class ExperienceCertificatesView extends StatelessWidget {
  const ExperienceCertificatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Experience cetificate"),
          leading: const BackIcon(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  for (int i = 0; i < controller.certificates.value.length; i++)
                    SelectedFileWidget(
                      controller.certificates.value[i],
                      remove: () => controller.removeItemId(i),
                    ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>showPickFileBottomSheet(
            context,
            pickFile: controller.pickFileCertificates,
            takeImage: controller.pickImageCameraCertificates,
            pickImage: controller.pickImageGaleryCertificates,
          ),
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
