import 'package:shawir/data/dio/methods.dart';
import 'package:shawir/data/response/languages_response.dart';
import 'package:shawir/data/response/professions_response.dart';
import 'package:shawir/data/response/upload_documents_response.dart';
import 'package:shawir/domain/models/sub_category.dart';
import '../../../domain/models/avatar.dart';
import '../../../domain/models/category.dart';
import '../../../domain/requests/update_avatar.dart';
import '../../../domain/requests/upload_document_request.dart';
import '../../../domain/requests/upload_video_request.dart';
import 'request_expert_api_impl.dart';

abstract class CategoryApi {
  factory CategoryApi(DioMethods dio) = CategoryApiImpl;
  Future<List<Category>> categories();
  Future<List<SubCategory>> subCategories(int id);
  Future<UploadDocumentsResponse> uploadDocument(UploadDocumentRequest request);
  Future<ExpertAvatar> changeAvatar(UpdateAvatarRequest request);
  Future<UploadDocumentsResponse> uploadVideo(UploadVideoRequest request);
  Future<LanguagesResponse> getLanguges();
  Future<ProfessionsResponse> getProffisions();
}
