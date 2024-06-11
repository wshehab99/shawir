import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/support/helpers.dart';
import '../controllers/request_expert_controller.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/selected_file_widget.dart';

class PhotoIdView extends StatelessWidget {
  const PhotoIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
          return controller.categoryLoad.value
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  appBar: AppBar(
                    title: const Text("Personal Photo & ID Proof"),
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
                                i < controller.personal.value.length;
                                i++)
                              SelectedFileWidget(
                                controller.personal.value[i],
                                remove: () => controller.removeItemPersonal(i),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => showPickFileBottomSheet(
                      context,
                      pickFile: controller.pickFilePersonal,
                      takeImage: controller.pickImageCameraPersonal,
                      pickImage: controller.pickImageGaleryPersonal,
                    ),
                    child: const Icon(Icons.add),
                  ),
                );
        });
  }
}
