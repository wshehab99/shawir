import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/support/utils/validator.dart';
import '../../../../resources/assets/svg_manager.dart';
import '../../controllers/request_expert_controller.dart';
import '../../widgets/sized_svg.dart';
import '../../widgets/social_media_widget.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
    required this.facebook,
    required this.insta,
    required this.linkedin,
    required this.snapchat,
    required this.tiktok,
    required this.twitter,
  });
  final TextEditingController tiktok;
  final TextEditingController facebook;
  final TextEditingController snapchat;
  final TextEditingController linkedin;
  final TextEditingController twitter;
  final TextEditingController insta;
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
                  controller: tiktok,
                ),
              if (controller.facebbokShown.value)
                SocialMediaWidget(
                  label: "Linke facebook",
                  delete: () => controller.unshowFacebook(),
                  validator: (value) => Validator.socialValidator(
                    value,
                    controller.facebbokShown.value,
                  ),
                  controller: facebook,
                ),
              if (controller.snapShown.value)
                SocialMediaWidget(
                  label: "Linke snapchat",
                  delete: () => controller.unshowSnapchat(),
                  validator: (value) => Validator.socialValidator(
                    value,
                    controller.snapShown.value,
                  ),
                  controller: snapchat,
                ),
              if (controller.inShown.value)
                SocialMediaWidget(
                  label: "Linke linkedin",
                  delete: () => controller.unshowIn(),
                  validator: (value) => Validator.socialValidator(
                    value,
                    controller.inShown.value,
                  ),
                  controller: linkedin,
                ),
              if (controller.twitterShown.value)
                SocialMediaWidget(
                  label: "Linke twitter",
                  delete: () => controller.unshowTwitter(),
                  validator: (value) => Validator.socialValidator(
                    value,
                    controller.twitterShown.value,
                  ),
                  controller: twitter,
                ),
              if (controller.instaShown.value)
                SocialMediaWidget(
                  label: "Linke instagram",
                  delete: () => controller.unshowInsta(),
                  validator: (value) => Validator.socialValidator(
                    value,
                    controller.instaShown.value,
                  ),
                  controller: insta,
                ),
            ],
          );
        });
  }
}
