import 'package:dio/dio.dart';
import 'package:shawir/data/dio/methods.dart';
import 'package:shawir/data/response/add_account_response.dart';
import 'package:shawir/data/response/languages_response.dart';
import 'package:shawir/data/response/professions_response.dart';
import 'package:shawir/data/response/upload_documents_response.dart';
import 'package:shawir/domain/models/avatar.dart';
import 'package:shawir/domain/models/category.dart';
import 'package:shawir/domain/models/sub_category.dart';
import 'package:shawir/domain/requests/update_avatar.dart';
import 'package:shawir/domain/requests/upload_document_request.dart';
import 'package:shawir/domain/requests/upload_video_request.dart';

import '../../../config/api.dart';
import '../../../config/app.dart';
import '../../../domain/requests/request_expert_request.dart';
import 'request_expert_api.dart';

class CategoryApiImpl implements CategoryApi {
  final DioMethods _dio;
  CategoryApiImpl(this._dio);

  @override
  Future<List<Category>> categories() async {
    Response result = await _dio.get<Category>(
      path: ApiConfig.categories,
      headers: {AppConfig.auth: ApiConfig.authToken},
    );
    return Category.fromList(result.data!);
  }

  @override
  Future<List<SubCategory>> subCategories(int id) async {
    Response result = await _dio.get<SubCategory>(
      path: ApiConfig.subCategory(id),
      headers: {AppConfig.auth: ApiConfig.authToken},
    );
    return SubCategory.fromList(result.data!);
  }

  @override
  Future<UploadDocumentsResponse> uploadDocument(
    UploadDocumentRequest request, {
    void Function(int, int)? onSentProgress,
  }) async {
    Response result = await _dio.post<UploadDocumentsResponse>(
      path: ApiConfig.uploadDocuments,
      data: await request.json,
      headers: {AppConfig.auth: ApiConfig.authToken},
      onSentProgress: onSentProgress,
    );
    return UploadDocumentsResponse.fromJson(result.data!);
  }

  @override
  Future<ExpertAvatar> changeAvatar(UpdateAvatarRequest request) async {
    Response result = await _dio.post<ExpertAvatar>(
      path: ApiConfig.avatar,
      data: await request.json,
      headers: {AppConfig.auth: ApiConfig.authToken},
    );
    return ExpertAvatar.fromJson(result.data!);
  }

  @override
  Future<UploadDocumentsResponse> uploadVideo(
    UploadVideoRequest request, {
    void Function(int, int)? onSentProgress,
  }) async {
    Response result = await _dio.post<UploadDocumentsResponse>(
      path: ApiConfig.uploadVideo,
      data: await request.json,
      headers: {AppConfig.auth: ApiConfig.authToken},
      onSentProgress: onSentProgress,
    );
    return UploadDocumentsResponse.fromJson(result.data!);
  }

  @override
  Future<LanguagesResponse> getLanguges() async {
    Response result = await _dio.get<LanguagesResponse>(
      path: ApiConfig.languages,
      headers: {AppConfig.auth: ApiConfig.authToken},
    );
    return LanguagesResponse.fromJson(result.data!);
  }

  @override
  Future<ProfessionsResponse> getProffisions() async {
    Response result = await _dio.get<ProfessionsResponse>(
      path: ApiConfig.professions,
      headers: {AppConfig.auth: ApiConfig.authToken},
    );
    return ProfessionsResponse.fromJson(result.data!);
  }

  @override
  Future<AddAccountResponse> addAccount(RequestExpertRequest request) async {
    Response result = await _dio.post<AddAccountResponse>(
      path: ApiConfig.addAccount,
      headers: {AppConfig.auth: ApiConfig.authToken},
      data: request.toJson(),
    );
    return AddAccountResponse.fromJson(result.data!);
  }
}
