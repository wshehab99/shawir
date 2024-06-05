import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class RequestExpertController extends GetxController {
  final currentPage = 0.obs;
  final facebbokShown = false.obs;
  final tiktokShown = false.obs;
  final snapShown = false.obs;
  final instaShown = false.obs;
  final inShown = false.obs;
  final twitterShown = false.obs;
  final youtubeShown = false.obs;

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

  void showFacebook() {
    facebbokShown.value = true;
    update();
  }

  void showTiktok() {
    tiktokShown.value = true;
    update();
  }

  void showInsta() {
    instaShown.value = true;
    update();
  }

  void showIn() {
    inShown.value = true;
    update();
  }

  void showTwitter() {
    twitterShown.value = true;
    update();
  }

  void showYoutube() {
    youtubeShown.value = true;
    update();
  }

  void showSnapchat() {
    snapShown.value = true;
    update();
  }

  void unshowFacebook() {
    facebbokShown.value = false;
    update();
  }

  void unshowTiktok() {
    tiktokShown.value = false;
    update();
  }

  void unshowSnapchat() {
    snapShown.value = false;
    update();
  }

  void unshowInsta() {
    instaShown.value = false;
    update();
  }

  void unshowIn() {
    inShown.value = false;
    update();
  }

  void unshowTwitter() {
    twitterShown.value = false;
    update();
  }

  void unshowYoutube() {
    youtubeShown.value = false;
    update();
  }
}
