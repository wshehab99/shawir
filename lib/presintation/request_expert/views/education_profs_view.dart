import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/support/helpers.dart';
import '../controllers/request_expert_controller.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/selected_file_widget.dart';

class EducationProfsView extends StatelessWidget {
  const EducationProfsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
          return controller.categoryLoad.value
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  appBar: AppBar(
                    title: const Text("Education Profs"),
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
                            for (int i = 0;
                                i < controller.proofs.value.length;
                                i++)
                              SelectedFileWidget(
                                controller.proofs.value[i],
                                remove: () => controller.removeItemId(i),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => showPickFileBottomSheet(
                      context,
                      pickFile: controller.pickFileId,
                      takeImage: controller.pickImageCameraId,
                      pickImage: controller.pickImageGaleryId,
                    ),
                    child: const Icon(Icons.add),
                  ),
                );
        });
  }
}
