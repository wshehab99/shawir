import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shawir/domain/models/languages.dart';
import 'package:shawir/domain/requests/request_expert_request.dart';
import 'package:shawir/domain/requests/upload_document_request.dart';
import 'package:video_player/video_player.dart';

import '../../../app/compressor/compressor.dart';
import '../../../app/support/helpers.dart';
import '../../../domain/models/avatar.dart';
import '../../../domain/models/category.dart';
import '../../../domain/models/document.dart';
import '../../../domain/models/professions.dart';
import '../../../domain/models/sub_category.dart';
import '../../../domain/repo/category/category_repo.dart';
import '../../../domain/requests/update_avatar.dart';
import '../../../domain/requests/upload_video_request.dart';

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
  final avatarLoad = false.obs;

  Rx<Country?> slectedCountry = Rx(null);
  void nextPage() {
    if (currentPage.value == 0) {
      if (avatar.value != null) {
        currentPage.value++;
        update();
      } else {
        Get.snackbar("image is required", "please select profile image ");
      }
    } else if (currentPage.value == 2) {
      if (selectedCategory.value == null ||
          selectedubCategories.value.isEmpty) {
        Get.snackbar(
          "fields required",
          "please select category and subcategory",
        );
      } else {
        currentPage.value++;
        update();
      }
    } else if (currentPage.value == 3) {
      if (proofs.value.isEmpty ||
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
          uploadProfileImage(value);
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
      categoryFromCache();
      update();
    });
  }

  Rx<Category?> selectedCategory = Rx(null);
  void changeSelectedCategory(Category? value) {
    if (value != selectedCategory.value) {
      selectedCategory.value = value;
      selectedubCategories.value = [];
      update();
      getSubCategories();
    }
  }

  Rx<Professions?> selectedProfisson = Rx(null);
  void changeSelectedProfessions(Professions? value) {
    selectedProfisson.value = value;
    update();
  }

  final subcategoryLoad = false.obs;
  List<SubCategory> subCategories = [];
  Rx<List<Languages>> languages = Rx([]);

  void getSubCategories() async {
    if (selectedCategory.value != null) {
      subcategoryLoad.value = true;

      update();
      (await _repo.subCategories(selectedCategory.value!.id)).fold((l) {
        subcategoryLoad.value = false;
        Get.snackbar("error", l.message);
      }, (r) {
        subcategoryLoad.value = false;
        subCategories = r;
      });
      update();
    } else {
      // Get.snackbar("category is empty", "please choose category first");
    }
  }

  Rx<List<SubCategory>> selectedubCategories = Rx([]);
  void changeSubSelectedCategory(SubCategory value) {
    if (selectedCategory.value != null) {
      if (!selectedubCategories.value.contains(value)) {
        selectedubCategories.value.add(value);
        update();
      }
    } else {
      Get.snackbar("category not selected", "plese select a ctegory first!");
    }
  }

  void deleteSubCategory(int index) {
    selectedubCategories.value.removeAt(index);
    update();
  }

  Rx<List<Languages>> selectedLanguage = Rx([]);
  void selectLanguage(Languages value) {
    if (!selectedLanguage.value.contains(value)) {
      selectedLanguage.value.add(value);
      update();
    }
  }

  void deletLanguage(int index) {
    selectedLanguage.value.removeAt(index);
    update();
  }

  @override
  void onInit() {
    getCategories();

    getSubCategories();
    getLanguges();
    getProffisions();
    getFromCache();
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
  Rx<List<Document>> proofs = Rx([]);
  Future<void> pickFileId() async {
    FilePickerResult? value = await pickFile();
    if (value != null) {
      if (validateFile(value.files.single.path ?? "")) {
        uploadDocument(XFile(value.files.single.path!), proofs.value)
            .then((_) => update());
      } else {
        Get.snackbar("pdf only", "you can upload pdf document only");
      }
    }
  }

  Future<void> pickImageCameraId() async {
    XFile? value = await pickImage(source: ImageSource.camera);
    if (value != null) {
      if (validateFile(value.path)) {
        uploadDocument(value, proofs.value).then((_) => update());
      }
    }
  }

  Future<void> pickImageGaleryId() async {
    XFile? value = await pickImage(source: ImageSource.gallery);
    if (value != null) {
      if (validateFile(value.path)) {
        uploadDocument(value, proofs.value).then((_) => update());
      }
    }
  }

  void removeItemId(int index) {
    proofs.value.removeAt(index);
    update();
  }

  Rx<List<Document>> certificates = Rx([]);
  Future<void> pickFileCertificates() async {
    FilePickerResult? value = await pickFile();
    if (value != null) {
      if (validateFile(value.files.single.path ?? "")) {
        uploadDocument(XFile(value.files.single.path!), certificates.value)
            .then((_) => update());
      } else {
        Get.snackbar("pdf only", "you can upload pdf document only");
      }
    }
  }

  Future<void> pickImageCameraCertificates() async {
    XFile? value = await pickImage(source: ImageSource.camera);
    if (value != null) {
      if (validateFile(value.path)) {
        uploadDocument(value, certificates.value).then((_) => update());
      }
    }
  }

  Future<void> pickImageGaleryCertificates() async {
    XFile? value = await pickImage(source: ImageSource.gallery);
    if (value != null) {
      if (validateFile(value.path)) {
        uploadDocument(value, certificates.value).then((_) => update());
      }
    }
  }

  void removeItemCertificates(int index) {
    certificates.value.removeAt(index);
    update();
  }

  Rx<List<Document>> personal = Rx([]);
  Future<void> pickFilePersonal() async {
    FilePickerResult? value = await pickFile();
    if (value != null) {
      if (validateFile(value.files.single.path ?? "")) {
        uploadDocument(XFile(value.files.single.path!), personal.value)
            .then((_) => update());
      } else {
        Get.snackbar("pdf only", "you can upload pdf document only");
      }
    }
  }

  Future<void> pickImageCameraPersonal() async {
    XFile? value = await pickImage(source: ImageSource.camera);
    if (value != null) {
      if (validateFile(value.path)) {
        uploadDocument(value, personal.value).then((_) => update());
      }
    }
  }

  Future<void> pickImageGaleryPersonal() async {
    XFile? value = await pickImage(source: ImageSource.gallery);
    if (value != null) {
      if (validateFile(value.path)) {
        uploadDocument(value, personal.value).then((_) => update());
      }
    }
  }

  void removeItemPersonal(int index) {
    personal.value.removeAt(index);
    update();
  }

  Rx<bool> isCompress = Rx(false);
  Rx<bool> videLoad = Rx(false);
  void pickVideo() {
    ImagePicker()
        .pickVideo(
            source: ImageSource.gallery,
            maxDuration: const Duration(seconds: 60))
        .then((value) async {
      if (value != null) {
        if (GetUtils.isVideo(value.path)) {
          VideoPlayerController testLengthController =
              VideoPlayerController.file(File(value.path)); //Your file here
          await testLengthController.initialize();
          if (testLengthController.value.duration.inSeconds <= 60) {
            // videLoad.value = true;
            isCompress.value = true;
            update();
            _compressor.compressVideo(value.path).then((comprssedValue) {
              if (comprssedValue != null) {
                isCompress.value = false;
                update();
                uploadVideo(comprssedValue.file!);
              }
            });
          } else {
            Get.snackbar(
                "max duration", "you can't choose video more than 60 seconds");
          }
        }
      }
    });
  }

  void deleteVideo() {
    video.value = null;
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

  Rx<Document?> video = Rx(null);
  void uploadVideo(File file) async {
    videLoad.value = true;
    progress.value = 0;
    (await _repo.uploadVideo(
      UploadVideoRequest(file),
      onSentProgress: onSentProgress,
    ))
        .fold((l) {
      Get.snackbar("error", l.message);
      videLoad.value = false;
      update();
    }, (r) {
      videLoad.value = false;
      video.value = r.data;
      update();
    });
  }

  Rx<ExpertAvatar?> avatar = Rx(null);
  void uploadProfileImage(XFile file) async {
    avatarLoad.value = true;
    (await _repo.changeAvatar(UpdateAvatarRequest(File(file.path)))).fold((l) {
      Get.snackbar("error", l.message);
      avatarLoad.value = false;
      update();
    }, (r) {
      avatar.value = r;
      avatarLoad.value = false;
      update();
    });
  }

  Rx<List<Document>> uploadedDocuments = Rx([]);
  Future<void> uploadDocument(XFile file, List<Document> list) async {
    categoryLoad.value = true;
    progress.value = 0;
    update();
    (await _repo.uploadDocument(
      UploadDocumentRequest(File(file.path)),
      onSentProgress: onSentProgress,
    ))
        .fold((l) {
      Get.snackbar("error", l.message);
      categoryLoad.value = false;
      update();
    }, (r) {
      list.add(r.data);
      categoryLoad.value = false;
      update();
    });
  }

  void cache({
    required String name,
    required String englishName,
    required String nickname,
    required String phoneNumber,
    required String about,
    required String tiktok,
    required String snapchat,
    required String facebook,
    required String insta,
    required String linkedin,
    required String twitter,
  }) async {
    final box = GetStorage();
    await box.write('name', name);
    await box.write('englishNmae', englishName);
    await box.write('nickname', nickname);
    await box.write('phoneNumber', phoneNumber);
    await box.write('about', about);
    await box.write('tiktok', tiktok);
    await box.write('snapchat', snapchat);
    await box.write('facebook', facebook);
    await box.write('insta', insta);
    await box.write('linkedin', linkedin);
    await box.write('twitter', twitter);
    await box.write("tiktokShown", tiktokShown.value);
    await box.write("snapShown", snapShown.value);
    await box.write("facebbokShown", facebbokShown.value);
    await box.write("instaShown", instaShown.value);
    await box.write("inShown", inShown.value);
    await box.write("twitterShown", twitterShown.value);
    await box.write("twitterShown", twitterShown.value);
    await box.write("introductionVideo", video.value);
    await box.write("educationFiles", proofs.value.cast<Document>());
    await box.write(
        "experienceCertificatesFiles", certificates.value.cast<Document>());
    await box.write("personalFiles", personal.value.cast<Document>());
    await box.write("slectedCountry", slectedCountry.value);
    await box.write("subCategories", subCategories);
    await box.write("avatar", avatar.value);
    await box.write("selectedCategory", selectedCategory.value);
    await box.write("terms", terms.value);
    await box.write("selectedLanguage", selectedLanguage.value);
    await box.write("selectedProfisson", selectedProfisson.value);
    await box.write("selectedubCategories", selectedubCategories.value);
    await box.write("currentPage", currentPage.value);
    print("cache----------->>>>>>>>>");
  }

  void getFromCache() {
    final box = GetStorage();
    tiktokShown.value = box.read('tiktokShown') ?? false;
    snapShown.value = box.read('snapShown') ?? false;
    facebbokShown.value = box.read('facebbokShown') ?? false;
    instaShown.value = box.read('instaShown') ?? false;
    inShown.value = box.read('inShown') ?? false;
    twitterShown.value = box.read('twitterShown') ?? false;
    video.value = getStorage<Document>(box.read('introductionVideo'));
    getLists(box);
    slectedCountry.value = getStorage<Country>(box.read('slectedCountry'));
    avatar.value = getStorage<ExpertAvatar>(box.read('avatar'));
    terms.value = box.read('terms') ?? false;
    currentPage.value = box.read('currentPage') ?? 0;
    selectedProfisson.value =
        getStorage<Professions>(box.read('selectedProfisson'));
  }

  void categoryFromCache() {
    selectedCategory.value =
        getStorage<Category>(GetStorage().read('selectedCategory'));
    getSubCategories();
  }

  void getLanguges() async {
    categoryLoad.value = true;
    update();
    (await _repo.languges()).fold((l) {
      Get.snackbar("language error", l.message);
      categoryLoad.value = false;
    }, (r) {
      languages.value = r.data;
      categoryLoad.value = false;
    });
    update();
  }

  Rx<List<Professions>> professions = Rx([]);
  void getProffisions() async {
    categoryLoad.value = true;
    update();
    (await _repo.proffisions()).fold((l) {
      Get.snackbar("language error", l.message);
      categoryLoad.value = false;
    }, (r) {
      professions.value = r.data;
      categoryLoad.value = false;
    });
    update();
  }

  bool validateFile(String path) =>
      GetUtils.isImage(path) || GetUtils.isPDF(path);
  void getLists(GetStorage box) {
    personal.value = Document.fromList(box.read('personalFiles') ?? []);
    selectedubCategories.value =
        SubCategory.fromList(box.read('selectedubCategories') ?? []);
    proofs.value = Document.fromList(box.read('educationFiles') ?? []);
    certificates.value =
        Document.fromList(box.read('experienceCertificatesFiles') ?? []);
    selectedLanguage.value =
        Languages.fromList(box.read('selectedLanguage') ?? []);
  }

  void requestExpert({
    required String aboutMe,
    required String fullName,
    required String nameEnglish,
    required String nickname,
    required String phoneNumber,
    String? tiktok,
    String? facebook,
    String? insta,
    String? snapchat,
    String? linkedIn,
    String? twitter,
  }) async {
    if (terms.value) {
      categoryLoad.value = true;
      update();
      (await _repo.addAccount(
        RequestExpertRequest(
          aboutMe: aboutMe,
          category: selectedCategory.value!,
          educationFiles: proofs.value,
          experienceCertificatesFiles: certificates.value,
          fullName: fullName,
          introductionVideo: video.value,
          nameEnglish: nameEnglish,
          nickname: nickname,
          personalFiles: personal.value,
          phoneNumber: phoneNumber,
          socialMedia: _getSocial(
            facebook: facebook,
            insta: insta,
            linkedIn: linkedIn,
            snapchat: snapchat,
            tiktok: tiktok,
            twitter: twitter,
          ),
          subCategory: selectedubCategories.value,
          languages: selectedLanguage.value,
        ),
      ))
          .fold((l) {
        categoryLoad.value = false;

        Get.snackbar("error", l.message);
      }, (r) {
        categoryLoad.value = false;

        Get.snackbar("success", r.data);
      });
      update();
    } else {
      Get.snackbar("terms", "you should accepet terms");
    }
  }

  List<SocialMedia> _getSocial({
    String? tiktok,
    String? facebook,
    String? insta,
    String? snapchat,
    String? linkedIn,
    String? twitter,
  }) =>
      <SocialMedia>[
        SocialMedia('facebook', facebook ?? "", facebbokShown.value),
        SocialMedia('tiktok', tiktok ?? "", tiktokShown.value),
        SocialMedia('snapchat', snapchat ?? "", facebbokShown.value),
        SocialMedia('instagram', insta ?? "", instaShown.value),
        SocialMedia('linkedIn', linkedIn ?? "", inShown.value),
        SocialMedia('twitter', twitter ?? "", twitterShown.value),
      ];
  Rx<double> progress = Rx(0);
  void onSentProgress(int sent, int total) {
    print(">>>>__________total$total");
    progress.value = sent / total;
    update();
  }
}
