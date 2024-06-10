import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/request_expert_controller.dart';

class SubmetStep extends StatelessWidget {
  const SubmetStep({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: controller.terms.value,
                    onChanged: controller.changeTerms,
                  ),
                  Text("Accept terms and conditions")
                ],
              ),
            ],
          );
        });
  }
}
