import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class RequestExpertController extends GetxController {
  final currentPage = 0.obs;
  // Rx<Country>? slectedCountry;
  final slectedCountry = Country(
    phoneCode: "",
    countryCode: "",
    displayName: "",
    displayNameNoCountryCode: "",
    e164Key: "",
    e164Sc: 0,
    example: "",
    geographic: false,
    level: 0,
    name: "",
  ).obs;
  void incrementPage() {
    currentPage.value++;
    update();
  }

  void decrementPage() {
    currentPage.value--;
    update();
  }

  void onSelect(Country country) {
    slectedCountry.value = country;
    update();
  }
}
