import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/category.dart';
import '../../../../domain/models/sub_category.dart';
import '../../../../resources/colors/app_colors.dart';
import '../../controllers/request_expert_controller.dart';
import '../../widgets/drop_category.dart';

class CategoryStep extends StatelessWidget {
  const CategoryStep({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                "Category",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.border,
                    ),
              ),
              const SizedBox(height: 10),
              DropCategory<Category>(
                value: controller.selectedCategory.value,
                onChanged: controller.changeSelectedCategory,
                items: controller.categories
                    .map<DropdownMenuItem<Category>>((Category value) =>
                        DropdownMenuItem(
                          value: value,
                          child: Text(
                            value.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 17),
              Text(
                "SubCategory",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.border,
                    ),
              ),
              const SizedBox(height: 10),
              DropCategory<SubCategory>(
                value: controller.selectedSubCategory.value,
                onChanged: controller.changeSubSelectedCategory,
                items: controller.subCategories
                    .map<DropdownMenuItem<SubCategory>>(
                      (SubCategory value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 17),
              Text(
                "Profession",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.border,
                    ),
              ),
              const SizedBox(height: 10),
              DropCategory<String>(
                value: "Graphic Designer",
                onChanged: (value) {},
                items: ['Graphic Designer']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        });
  }
}
