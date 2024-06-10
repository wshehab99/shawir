import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shawir/app/support/helpers.dart';
import 'package:shawir/domain/models/languages.dart';

import '../../../../domain/models/sub_category.dart';
import '../../../../resources/colors/app_colors.dart';
import '../../controllers/request_expert_controller.dart';

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
              CategoryDecoratedContainer(
                child: Text(
                  controller.selectedCategory.value != null
                      ? controller.selectedCategory.value!.name
                      : "select",
                  style: controller.selectedCategory.value != null
                      ? Theme.of(context).textTheme.headlineMedium
                      : null,
                ),
                onTap: () => showCategoryBottomsheet(
                  context,
                  items: controller.categories,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      controller
                          .changeSelectedCategory(controller.categories[index]);
                      Navigator.pop(context);
                    },
                    title: Text(
                      controller.categories[index].name,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              Text(
                "SubCategory",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.border,
                    ),
              ),
              const SizedBox(height: 10),
              CategoryDecoratedContainer(
                child: controller.selectedubCategories.value.isEmpty
                    ? const Text(
                        "select",
                      )
                    : Expanded(
                        child: SubCategoriesWrap(
                          controller.selectedubCategories.value,
                        ),
                      ),
                onTap: () => showCategoryBottomsheet(
                  context,
                  items: controller.subCategories,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      controller.changeSubSelectedCategory(
                          controller.subCategories[index]);
                      Navigator.pop(context);
                    },
                    title: Text(
                      controller.subCategories[index].name,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              Text(
                "Profession",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.border,
                    ),
              ),
              const SizedBox(height: 10),
              CategoryDecoratedContainer(
                child: Text(
                  controller.selectedProfisson.value != null
                      ? controller.selectedProfisson.value!.professionName
                      : "select",
                  style: controller.selectedProfisson.value != null
                      ? Theme.of(context).textTheme.headlineMedium
                      : null,
                ),
                onTap: () => showCategoryBottomsheet(
                  context,
                  items: controller.professions.value,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      controller.changeSelectedProfessions(
                          controller.professions.value[index]);
                      Navigator.pop(context);
                    },
                    title: Text(
                      controller.professions.value[index].professionName,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              Text(
                "Languages",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.border,
                    ),
              ),
              const SizedBox(height: 10),
              CategoryDecoratedContainer(
                child: controller.selectedLanguage.value.isEmpty
                    ? const Text(
                        "select",
                      )
                    : Expanded(
                        child: LanguagesWrap(
                          controller.selectedLanguage.value,
                        ),
                      ),
                onTap: () => showCategoryBottomsheet(
                  context,
                  items: controller.languages.value,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      controller
                          .selectLanguage(controller.languages.value[index]);
                      Navigator.pop(context);
                    },
                    title: Text(
                      controller.languages.value[index].langName,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class CategoryDecoratedContainer extends StatelessWidget {
  const CategoryDecoratedContainer({
    super.key,
    required this.child,
    this.onTap,
  });
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child,
            const Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.border,
            )
          ],
        ),
      ),
    );
  }
}

class SubCategoriesWrap extends StatelessWidget {
  const SubCategoriesWrap(this.itms, {super.key});
  final List<SubCategory> itms;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: itms.map((item) => SelectedSubCategory(item)).toList(),
    );
  }
}

class SelectedSubCategory extends StatelessWidget {
  const SelectedSubCategory(this.subCategory, {super.key});
  final SubCategory subCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.appBarTitle,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        subCategory.name,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class LanguagesWrap extends StatelessWidget {
  const LanguagesWrap(this.itms, {super.key});
  final List<Languages> itms;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: itms.map((item) => SelectedLanguages(item)).toList(),
    );
  }
}

class SelectedLanguages extends StatelessWidget {
  const SelectedLanguages(this.languages, {super.key});
  final Languages languages;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.appBarTitle,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        languages.langName,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
