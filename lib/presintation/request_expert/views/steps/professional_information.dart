import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/support/utils/validator.dart';
import '../../controllers/request_expert_controller.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/select_image_widget.dart';

class ProfessionalInformation extends StatelessWidget {
  const ProfessionalInformation({
    super.key,
    required this.about,
    required this.englishName,
    required this.name,
    required this.nickname,
    required this.phone,
  });
  final TextEditingController name;
  final TextEditingController englishName;
  final TextEditingController nickname;
  final TextEditingController phone;
  final TextEditingController about;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestExpertController>(
        init: Get.find<RequestExpertController>(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SelectImageWidget(
                  image: controller.avatar.value?.uriFormatted,
                  pick: controller.pickProfileImage,
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
                controller: name,
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
                controller: englishName,
                validator: (value) => Validator.englishNameValidator(value),
              ),
              const SizedBox(height: 7),
              Text(
                "Nickname",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "Enter Your Nickname",
                controller: nickname,
                validator: (value) => Validator.nameValidator(value),
              ),
              const SizedBox(height: 7),
              Text(
                "Phone Number",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomTextField(
                      hintText: "choose your country",
                      // enabled: false,
                      controller: TextEditingController(
                        text: controller.slectedCountry.value != null
                            ? "+${controller.slectedCountry.value!.phoneCode}"
                            : "",
                      ),
                      validator: (value) => Validator.countryValidator(value),
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
                      controller: phone,
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
                controller: about,
                validator: (value) => Validator.aboutValidator(value),
              ),
            ],
          );
        });
  }
}
