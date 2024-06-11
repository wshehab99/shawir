import 'package:shawir/domain/models/category.dart';
import 'package:shawir/domain/models/document.dart';
import 'package:shawir/domain/models/sub_category.dart';

import '../models/languages.dart';

class RequestExpertRequest {
  final String fullName;
  final String phoneNumber;
  final String aboutMe;
  final String nameEnglish;
  final String nickname;
  final Document introductionVideo;
  final List<SocialMedia> socialMedia;
  final Category category;
  final List<SubCategory> subCategory;
  final List<Document> educationFiles;
  final List<Document> personalFiles;
  final List<Document> experienceCertificatesFiles;
  final List<Languages> languages;
  RequestExpertRequest({
    required this.aboutMe,
    required this.category,
    required this.educationFiles,
    required this.experienceCertificatesFiles,
    required this.fullName,
    required this.introductionVideo,
    required this.nameEnglish,
    required this.nickname,
    required this.personalFiles,
    required this.phoneNumber,
    required this.socialMedia,
    required this.subCategory,
    required this.languages,
  });
  Map<String, dynamic> toJson() => {
        'category': category.id,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'aboutMe': aboutMe,
        'nameEnglish': nameEnglish,
        'nickname': nickname,
        'introductionVideo': introductionVideo.documentUri,
        'subCategory': subCategory.map((e) => e.toJson()).toList(),
        'socialMedia': SocialMedia.toListJson(socialMedia),
        'educationFiles': educationFiles.map((e) => e.documentUri).toList(),
        'personalFiles': personalFiles.map((e) => e.documentUri).toList(),
        'experienceCertificatesFiles':
            experienceCertificatesFiles.map((e) => e.documentUri).toList(),
        'languages': languages.map((e) => e.toJson()).toList()
      };
}

class SocialMedia {
  final String sociealType;
  final String userName;
  final bool isAdded;
  SocialMedia(this.sociealType, this.userName, this.isAdded);
  Map<String, dynamic> toJson() => {
        'sociealType': sociealType,
        'userName': userName,
      };
  static List<Map<String, dynamic>> toListJson(List<SocialMedia> list) {
    List<Map<String, dynamic>> result = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].isAdded) {
        result.add(list[i].toJson());
      }
    }
    return result;
  }
}
