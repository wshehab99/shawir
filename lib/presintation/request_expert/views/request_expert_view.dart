import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shawir/app/support/utils/validator.dart';
import 'package:shawir/resources/assets/assets_manager.dart';
import 'package:shawir/resources/assets/svg_manager.dart';
import 'package:shawir/resources/colors/app_colors.dart';

import '../controllers/request_expert_controller.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/attatchment_widget.dart';
import '../widgets/custom_steper.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/step_controller_button.dart';

class RequestExpertView extends StatelessWidget {
  RequestExpertView({super.key});
  // final RequestExpertController controller = Get.put(RequestExpertController());
  final List _formsKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final TextEditingController _name = TextEditingController();
  final TextEditingController _englishName = TextEditingController();
  final TextEditingController _nickname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _about = TextEditingController();
  final TextEditingController _tiktok = TextEditingController();
  final TextEditingController _facebook = TextEditingController();
  final TextEditingController _linkedin = TextEditingController();
  final TextEditingController _snapchat = TextEditingController();
  final TextEditingController _twitter = TextEditingController();
  final TextEditingController _insta = TextEditingController();
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
              if (controller.currentPage > 0 && controller.currentPage < 4)
                StepControllerButton(
                  onPressed: controller.currentPage > 0
                      ? () => controller.decrementPage()
                      : null,
                  text: "Back",
                ),
              if (controller.currentPage < 4)
                StepControllerButton(
                  onPressed: controller.currentPage < 4
                      ? () {
                          if (_formsKey[controller.currentPage.value]
                              .currentState!
                              .validate()) {
                            controller.incrementPage();
                          }
                        }
                      : null,
                  text: "Next",
                ),
              if (controller.currentPage.value == 4)
                StepControllerButton(
                  onPressed: () => controller.currentPage < 4
                      ? controller.incrementPage()
                      : null,
                  text: "Send",
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
              content: Form(
                key: _formsKey[0],
                child: Column(
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
                    CustomTextField(
                      hintText: "Enter Your Name",
                      controller: _name,
                      validator: (value) => Validator.nameValidator(value),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Name English",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: "Enter Your Name English",
                      controller: _englishName,
                      validator: (value) =>
                          Validator.englishNameValidator(value),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Nickname",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: "Enter Your Nickname",
                      controller: _nickname,
                      validator: (value) => Validator.nameValidator(value),
                    ),
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
                            validator: (value) =>
                                Validator.countryValidator(value),
                            onTap: () => showCountryPicker(
                              context: context,
                              onSelect: (value) => controller.onSelect(value),
                            ),
                            keyboardType: TextInputType.number,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        const SizedBox(width: 11),
                        Expanded(
                          flex: 3,
                          child: CustomTextField(
                            hintText: "Enter Your Phone Number",
                            keyboardType: TextInputType.number,
                            controller: _phone,
                            validator: (value) =>
                                Validator.phoneNumberValidator(value),
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
                    CustomTextField(
                      maxLines: 3,
                      maxLength: 50,
                      controller: _about,
                      validator: (value) => Validator.aboutValidator(value),
                    ),
                  ],
                ),
              ),
            ),
            CustomStep(
              isActive: controller.currentPage.value == 1,
              state: controller.currentPage.value > 1
                  ? CustomStepState.complete
                  : CustomStepState.indexed,
              content: Form(
                key: _formsKey[1],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => controller.showTiktok(),
                            icon: const Icon(Icons.tiktok)),
                        IconButton(
                            onPressed: () => controller.showFacebook(),
                            icon: const Icon(Icons.facebook)),
                        IconButton(
                          onPressed: () => controller.showIn(),
                          icon: const SizedSvg(SvgsManager.linkedin),
                        ),
                        IconButton(
                          onPressed: () => controller.showSnapchat(),
                          icon: const Icon(Icons.snapchat),
                        ),
                        IconButton(
                          onPressed: () => controller.showTwitter(),
                          icon: const SizedSvg(SvgsManager.twitter),
                        ),
                        IconButton(
                          onPressed: () => controller.showInsta(),
                          icon: const SizedSvg(SvgsManager.instagram),
                        ),
                      ],
                    ),
                    if (controller.tiktokShown.value)
                      SocialMediaWidget(
                        label: "Linke tiktok",
                        delete: () => controller.unshowTiktok(),
                        validator: (value) => Validator.socialValidator(
                          value,
                          controller.tiktokShown.value,
                        ),
                        controller: _tiktok,
                      ),
                    if (controller.facebbokShown.value)
                      SocialMediaWidget(
                        label: "Linke facebook",
                        delete: () => controller.unshowFacebook(),
                        validator: (value) => Validator.socialValidator(
                          value,
                          controller.facebbokShown.value,
                        ),
                        controller: _facebook,
                      ),
                    if (controller.snapShown.value)
                      SocialMediaWidget(
                        label: "Linke snapchat",
                        delete: () => controller.unshowSnapchat(),
                        validator: (value) => Validator.socialValidator(
                          value,
                          controller.snapShown.value,
                        ),
                        controller: _snapchat,
                      ),
                    if (controller.inShown.value)
                      SocialMediaWidget(
                        label: "Linke linkedin",
                        delete: () => controller.unshowIn(),
                        validator: (value) => Validator.socialValidator(
                          value,
                          controller.inShown.value,
                        ),
                        controller: _linkedin,
                      ),
                    if (controller.twitterShown.value)
                      SocialMediaWidget(
                        label: "Linke twitter",
                        delete: () => controller.unshowTwitter(),
                        validator: (value) => Validator.socialValidator(
                          value,
                          controller.twitterShown.value,
                        ),
                        controller: _twitter,
                      ),
                    if (controller.instaShown.value)
                      SocialMediaWidget(
                        label: "Linke instagram",
                        delete: () => controller.unshowInsta(),
                        validator: (value) => Validator.socialValidator(
                          value,
                          controller.instaShown.value,
                        ),
                        controller: _insta,
                      ),
                  ],
                ),
              ),
            ),
            CustomStep(
              isActive: controller.currentPage.value == 2,
              state: controller.currentPage.value > 2
                  ? CustomStepState.complete
                  : CustomStepState.indexed,
              content: Form(
                key: _formsKey[2],
                child: const Column(
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
            ),
            CustomStep(
              isActive: controller.currentPage.value == 3,
              state: controller.currentPage.value > 3
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
              isActive: controller.currentPage.value == 4,
              state: controller.currentPage.value > 4
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

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
    required this.label,
    required this.delete,
    this.validator,
    this.controller,
  });
  final String label;
  final void Function()? delete;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 7),
          CustomTextField(
            prefixIcon: const Icon(Icons.alternate_email),
            suffixIcon: IconButton(
              onPressed: delete,
              icon: const Icon(Icons.delete),
            ),
            validator: validator,
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class SizedSvg extends StatelessWidget {
  const SizedSvg(this.path, {super.key, this.color, this.dimension});
  final String path;
  final double? dimension;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension ?? 25,
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          color ?? Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
