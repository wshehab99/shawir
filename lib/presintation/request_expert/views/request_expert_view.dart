import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/request_expert_controller.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/custom_steper.dart';
import '../widgets/step_controller_button.dart';
import 'steps/attachment_upload.dart';
import 'steps/category_step.dart';
import 'steps/introduction_video.dart';
import 'steps/professional_information.dart';
import 'steps/social_media.dart';
import 'steps/submet_step.dart';

class RequestExpertView extends StatefulWidget {
  const RequestExpertView({super.key});

  @override
  State<RequestExpertView> createState() => _RequestExpertViewState();
}

class _RequestExpertViewState extends State<RequestExpertView>
    with WidgetsBindingObserver {
  final List _formsKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) _cache();
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    _cache();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    final box = GetStorage();
    _name.text = box.read('name') ?? "";
    _englishName.text = box.read('englishNmae') ?? "";
    _nickname.text = box.read('nickname') ?? "";
    _phone.text = box.read('phoneNumber') ?? "";
    _about.text = box.read('about') ?? "";
    _tiktok.text = box.read('tiktok') ?? "";
    _facebook.text = box.read('facebook') ?? "";
    _linkedin.text = box.read('linkedin') ?? "";
    _snapchat.text = box.read('snapchat') ?? "";
    _twitter.text = box.read('twitter') ?? "";
    _insta.text = box.read('insta') ?? "";

    super.initState();
  }

  void _cache() => Get.find<RequestExpertController>().cache(
        name: _name.text,
        englishName: _englishName.text,
        phoneNumber: _phone.text,
        about: _about.text,
        tiktok: _tiktok.text,
        snapchat: _snapchat.text,
        facebook: _facebook.text,
        insta: _insta.text,
        nickname: _nickname.text,
        linkedin: _linkedin.text,
        twitter: _twitter.text,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request an expert"),
        leading: const BackIcon(),
      ),
      body: GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) => controller.categoryLoad.value
            ? const Center(child: CircularProgressIndicator())
            : CustomStepper(
                elevation: 0,
                type: CustomStepperType.horizontal,
                currentStep: controller.currentPage.value,
                controlsBuilder: (context, details) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.currentPage > 0 &&
                        controller.currentPage < 5)
                      StepControllerButton(
                        onPressed: controller.currentPage > 0
                            ? () => controller.decrementPage()
                            : null,
                        text: "Back",
                      ),
                    if (controller.currentPage < 5)
                      StepControllerButton(
                        onPressed: controller.currentPage < 5
                            ? () {
                                if (_formsKey[controller.currentPage.value]
                                    .currentState!
                                    .validate()) {
                                  controller.nextPage();
                                }
                              }
                            : null,
                        text: "Next",
                      ),
                    if (controller.currentPage.value > 4)
                      StepControllerButton(
                        onPressed: controller.currentPage > 4
                            ? controller.sendRequest
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
                      child: ProfessionalInformation(
                        about: _about,
                        englishName: _englishName,
                        name: _name,
                        nickname: _nickname,
                        phone: _phone,
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
                      child: SocialMedia(
                        facebook: _facebook,
                        insta: _insta,
                        linkedin: _linkedin,
                        snapchat: _snapchat,
                        tiktok: _tiktok,
                        twitter: _twitter,
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
                      child: const CategoryStep(),
                    ),
                  ),
                  CustomStep(
                    isActive: controller.currentPage.value == 3,
                    state: controller.currentPage.value > 3
                        ? CustomStepState.complete
                        : CustomStepState.indexed,
                    content: Form(
                      key: _formsKey[3],
                      child: const AttachmentUpload(),
                    ),
                  ),
                  CustomStep(
                    isActive: controller.currentPage.value == 4,
                    state: controller.currentPage.value > 4
                        ? CustomStepState.complete
                        : CustomStepState.indexed,
                    content: Form(
                      key: _formsKey[4],
                      child: const IntroductionVideo(),
                    ),
                  ),
                  CustomStep(
                    isActive: controller.currentPage.value == 4,
                    state: controller.currentPage.value > 4
                        ? CustomStepState.complete
                        : CustomStepState.indexed,
                    content: Form(
                      key: _formsKey[5],
                      child: const SubmetStep(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
