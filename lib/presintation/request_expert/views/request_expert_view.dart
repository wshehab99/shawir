import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shawir/resources/assets/assets_manager.dart';
import 'package:shawir/resources/colors/app_colors.dart';

import '../controllers/request_expert_controller.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/custom_steper.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/step_controller_button.dart';

class RequestExpertView extends StatelessWidget {
  const RequestExpertView({super.key});
  // final RequestExpertController controller = Get.put(RequestExpertController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request an expert"),
        leading: const BackIcon(),
      ),
      body: GetBuilder<RequestExpertController>(
        init: RequestExpertController(),
        builder: (controller) => CustomStepper(
          elevation: 0,
          type: CustomStepperType.horizontal,
          currentStep: controller.currentPage.value,
          controlsBuilder: (context, details) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (controller.currentPage > 0)
                StepControllerButton(
                  onPressed: () => controller.currentPage > 0
                      ? controller.decrementPage()
                      : null,
                  text: "Back",
                ),
              if (controller.currentPage < 4)
                StepControllerButton(
                  onPressed: () => controller.currentPage < 4
                      ? controller.incrementPage()
                      : null,
                  text: "Next",
                ),
            ],
          ),
          steps: [
            CustomStep(
              isActive: controller.currentPage.value == 0,
              state: controller.currentPage.value > 0
                  ? CustomStepState.complete
                  : CustomStepState.indexed,
              stepStyle: const CustomStepStyle(),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 111,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            "https://avatars.githubusercontent.com/u/57075865?v=4",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const PositionedDirectional(
                          bottom: -6,
                          end: -6,
                          child: AppBarIcons(
                            icon: Icon(Icons.camera_alt_outlined),
                            height: 36,
                            width: 36,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(hintText: "Enter Your Name"),
                  const SizedBox(height: 7),
                  Text(
                    "Name English",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(hintText: "Enter Your Name English"),
                  const SizedBox(height: 7),
                  Text(
                    "Nickname",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(hintText: "Enter Your Nickname"),
                  const SizedBox(height: 7),
                  Text(
                    "Phone Number",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          hintText: "choose your country",
                          // enabled: false,
                          controller: TextEditingController(
                            text: controller
                                    .slectedCountry.value.phoneCode.isNotEmpty
                                ? "+${controller.slectedCountry.value.phoneCode}"
                                : "",
                          ),
                          onTap: () => showCountryPicker(
                            context: context,
                            onSelect: (value) => controller.onSelect(value),
                          ),
                          keyboardType: TextInputType.number,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      const SizedBox(width: 11),
                      const Expanded(
                        flex: 3,
                        child: CustomTextField(
                          hintText: "Enter Your Phone Number",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "About Me",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    maxLines: 3,
                    maxLength: 50,
                  ),
                ],
              ),
            ),
            CustomStep(
              isActive: controller.currentPage.value == 1,
              state: controller.currentPage.value > 1
                  ? CustomStepState.complete
                  : CustomStepState.indexed,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  CategoryRowWidget(
                    label: 'Category',
                    selected: "Designer",
                  ),
                  SizedBox(height: 17),
                  CategoryRowWidget(
                    label: 'SubCategory',
                    selected: "Designer",
                  ),
                  SizedBox(height: 17),
                  CategoryRowWidget(
                    label: 'Profession',
                    selected: "Graphic Designer",
                  ),
                ],
              ),
            ),
            CustomStep(
              isActive: controller.currentPage.value == 2,
              state: controller.currentPage.value > 2
                  ? CustomStepState.complete
                  : CustomStepState.indexed,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AttatchmentWidget(
                    label: 'Education Proofs',
                    imagePath: AssetsManager.cv1,
                  ),
                  SizedBox(height: 15),
                  AttatchmentWidget(
                    label: 'Experience Certificates',
                    imagePath: AssetsManager.cv2,
                  ),
                  SizedBox(height: 15),
                  AttatchmentWidget(
                    label: 'Personal Photo & ID Proof',
                    imagePath: AssetsManager.cv3,
                  ),
                ],
              ),
            ),
            CustomStep(
              isActive: controller.currentPage.value == 2,
              state: controller.currentPage.value > 2
                  ? CustomStepState.complete
                  : CustomStepState.indexed,
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: []),
            ),
            CustomStep(
              isActive: controller.currentPage.value == 2,
              state: controller.currentPage.value > 2
                  ? CustomStepState.complete
                  : CustomStepState.indexed,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 111,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            "https://avatars.githubusercontent.com/u/57075865?v=4",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const PositionedDirectional(
                          bottom: -6,
                          end: -6,
                          child: AppBarIcons(
                            icon: Icon(Icons.camera_alt_outlined),
                            height: 36,
                            width: 36,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(hintText: "Enter Your Name"),
                  const SizedBox(height: 7),
                  Text(
                    "Name English",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(hintText: "Enter Your Name English"),
                  const SizedBox(height: 7),
                  Text(
                    "Nickname",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(hintText: "Enter Your Nickname"),
                  const SizedBox(height: 7),
                  Text(
                    "Phone Number",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    hintText: "Enter Your Phone Number",
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "About Me",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    maxLines: 3,
                    maxLength: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({
    super.key,
    required this.label,
    this.selected,
  });
  final String? selected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.border,
              ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.border, width: 2),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selected ?? "",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ],
    );
  }
}

class AttatchmentWidget extends StatelessWidget {
  const AttatchmentWidget({
    super.key,
    required this.label,
    required this.imagePath,
  });
  final String label;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2.5,
              color: AppColors.appBarTitle,
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 25,
                      color: AppColors.border,
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  StepControllerButton(
                    onPressed: () {},
                    text: "Add Profe",
                    height: 40,
                  ),
                  StepControllerButton(
                    onPressed: () {},
                    text: "Edit Profe",
                    height: 40,
                    color: AppColors.border,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AttatchmentButton extends StatelessWidget {
  const AttatchmentButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 45,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
