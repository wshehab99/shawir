import 'package:shawir/domain/models/category.dart';
import 'package:shawir/domain/models/document.dart';

class RequestExpertRequest {
  final String fullName;
  final String phoneNumber;
  final String aboutMe;
  final String nameEnglish;
  final String nickname;
  final Document introductionVideo;
  final List<SocialMedia> socialMedia;
  final Category category;
  final List<Category> subCategory;
  final List<Document> educationFiles;
  final List<Document> personalFiles;
  final List<Document> experienceCertificatesFiles;
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
  });
}

class SocialMedia {
  final String sociealType;
  final String userName;
  final bool isAdded;
  SocialMedia(this.sociealType, this.userName, this.isAdded);
}
