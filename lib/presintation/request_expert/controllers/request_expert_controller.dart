import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/compressor/compressor.dart';
import '../../../domain/models/category.dart';
import '../../../domain/models/sub_category.dart';
import '../../../domain/repo/category/category_repo.dart';

class RequestExpertController extends GetxController {
  final CategoryRepo _repo;
  final Compressor _compressor;
  RequestExpertController(this._repo, this._compressor);
  final currentPage = 0.obs;
  final facebbokShown = false.obs;
  final tiktokShown = false.obs;
  final snapShown = false.obs;
  final instaShown = false.obs;
  final inShown = false.obs;
  final twitterShown = false.obs;
  final youtubeShown = false.obs;
  final categoryLoad = false.obs;

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
  final Rx<XFile?> profileImage = Rx(null);
  void nextPage() {
    if (currentPage.value == 0) {
      if (profileImage.value != null) {
        currentPage.value++;
        update();
      } else {
        Get.snackbar("image is required", "please select profile image ");
      }
    } else if (currentPage.value == 2) {
      if (selectedCategory.value == null || selectedSubCategory.value == null) {
        Get.snackbar(
          "fields required",
          "please select category and subcategory",
        );
      } else {
        currentPage.value++;
        update();
      }
    } else if (currentPage.value == 3) {
      if (ids.value.isEmpty ||
          certificates.value.isEmpty ||
          personal.value.isEmpty) {
        Get.snackbar(
          "fields required",
          "please select Educational profs, Expieracne certificate and personal photo",
        );
      } else {
        currentPage.value++;
        update();
      }
    } else if (currentPage.value == 4) {
      if (pickedVideo.value == null) {
        Get.snackbar(
          "fields required",
          "please select introduction video",
        );
      } else {
        currentPage.value++;
        update();
      }
    } else {
      currentPage.value++;
      update();
    }
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

  void pickProfileImage() async {
    pickImage().then((value) {
      if (value != null) {
        if (GetUtils.isImage(value.path)) {
          profileImage.value = value;
          update();
        } else {
          Get.snackbar("Image not valid", "please choose a valid image!.");
        }
      }
    });
  }

  List<Category> categories = [];
  void getCategories() async {
    categoryLoad.value = true;
    update();
    (await _repo.categories()).fold((l) {
      categoryLoad.value = false;
      Get.snackbar("error", l.message);
    }, (r) {
      categoryLoad.value = false;
      categories = r;
    });
    update();
  }

  Rx<Category?> selectedCategory = Rx(null);
  void changeSelectedCategory(Category? value) {
    selectedCategory.value = value;
    update();
    getSubCategories();
  }

  List<SubCategory> subCategories = [];
  void getSubCategories() async {
    if (selectedCategory.value != null) {
      categoryLoad.value = true;
      selectedSubCategory.value = null;
      update();
      (await _repo.subCategories(selectedCategory.value!.id)).fold((l) {
        categoryLoad.value = false;
        Get.snackbar("error", l.message);
      }, (r) {
        categoryLoad.value = false;
        subCategories = r;
      });
      update();
    } else {
      Get.snackbar("category is empty", "please choose category first");
    }
  }

  Rx<SubCategory?> selectedSubCategory = Rx(null);
  void changeSubSelectedCategory(SubCategory? value) {
    selectedSubCategory.value = value;
    update();
  }

  @override
  void onInit() {
    getCategories();

    super.onInit();
  }

  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    final value = await ImagePicker().pickImage(source: source);
    if (value != null) {
      return _compressor.compressImage(value);
    }
    return null;
  }

  Future<List<XFile>> pickMultiImage() async {
    List<XFile> compressed = [];

    List<XFile> result = await ImagePicker().pickMultiImage();
    if (result.isNotEmpty) {
      for (var image in result) {
        var com = await _compressor.compressImage(image);
        if (com != null) {
          compressed.add(com);
        }
      }
    }
    return compressed;
  }

  Future<FilePickerResult?> pickFile() => FilePicker.platform.pickFiles();
  Rx<List<File>> ids = Rx([]);
  Future<void> pickFileId() async {
    pickFile().then((value) {
      if (value != null) {
        if (validateFile(value.files.single.path ?? "")) {
          ids.value.add(File(value.files.single.path!));
          update();
        }
      }
    });
  }

  Future<void> pickImageCameraId() async {
    pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        if (validateFile(value.path)) {
          ids.value.add(File(value.path));
          update();
        }
      }
    });
  }

  Future<void> pickImageGaleryId() async {
    pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        if (validateFile(value.path)) {
          ids.value.add(File(value.path));
          update();
        }
      }
    });
  }

  void removeItemId(int index) {
    ids.value.removeAt(index);
    update();
  }

  Rx<List<File>> certificates = Rx([]);
  Future<void> pickFileCertificates() async {
    pickFile().then((value) {
      if (value != null) {
        if (validateFile(value.files.single.path ?? "")) {
          certificates.value.add(File(value.files.single.path!));
          update();
        }
      }
    });
  }

  Future<void> pickImageCameraCertificates() async {
    pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        if (validateFile(value.path)) {
          certificates.value.add(File(value.path));
          update();
        }
      }
    });
  }

  Future<void> pickImageGaleryCertificates() async {
    pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        if (validateFile(value.path)) {
          certificates.value.add(File(value.path));
          update();
        }
      }
    });
  }

  void removeItemCertificates(int index) {
    certificates.value.removeAt(index);
    update();
  }

  Rx<List<File>> personal = Rx([]);
  Future<void> pickFilePersonal() async {
    pickFile().then((value) {
      if (value != null) {
        if (validateFile(value.files.single.path ?? "")) {
          personal.value.add(File(value.files.single.path!));
          update();
        }
      }
    });
  }

  Future<void> pickImageCameraPersonal() async {
    pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        if (validateFile(value.path)) {
          personal.value.add(File(value.path));
          update();
        }
      }
    });
  }

  Future<void> pickImageGaleryPersonal() async {
    pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        if (validateFile(value.path)) {
          personal.value.add(File(value.path));
          update();
        }
      }
    });
  }

  void removeItemPersonal(int index) {
    personal.value.removeAt(index);
    update();
  }

  Rx<File?> pickedVideo = Rx(null);
  void pickVideo() {
    ImagePicker()
        .pickVideo(
            source: ImageSource.gallery,
            maxDuration: const Duration(minutes: 1))
        .then((value) {
      if (value != null) {
        if (GetUtils.isVideo(value.path)) {
          categoryLoad.value = true;
          update();
          _compressor.compressVideo(value.path).then((comprssedValue) {
            pickedVideo.value = comprssedValue?.file;
            categoryLoad.value = false;

            update();
          });
        }
      }
    });
  }

  void deleteVideo() {
    pickedVideo.value = null;
    update();
  }

  void sendRequest() {
    if (terms.value) {
    } else {
      Get.snackbar(
        " terms and conditions",
        "You must accept terms and conditions",
      );
    }
  }

  final terms = true.obs;
  void changeTerms(bool? value) {
    if (value != null) {
      terms.value = value;
    }
    update();
  }

  //todo::
  void uploadVideo() {}
  void uploadProfileImage() {}
  void uploadDocument() {}

  bool validateFile(String path) =>
      GetUtils.isImage(path) || GetUtils.isPDF(path);
}
