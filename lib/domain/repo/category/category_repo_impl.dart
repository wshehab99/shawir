import 'package:dartz/dartz.dart';

import 'package:shawir/app/exceptions/failure.dart';
import 'package:shawir/data/response/add_account_response.dart';
import 'package:shawir/data/response/languages_response.dart';
import 'package:shawir/data/response/professions_response.dart';
import 'package:shawir/data/response/upload_documents_response.dart';
import 'package:shawir/domain/models/avatar.dart';

import 'package:shawir/domain/models/category.dart';

import 'package:shawir/domain/models/sub_category.dart';
import 'package:shawir/domain/requests/request_expert_request.dart';
import 'package:shawir/domain/requests/update_avatar.dart';
import 'package:shawir/domain/requests/upload_document_request.dart';
import 'package:shawir/domain/requests/upload_video_request.dart';

import '../../../app/exceptions/handler.dart';
import '../../../config/error_data_source.dart';
import '../../../data/api/request_expert/request_expert_api.dart';
import '../../../data/info/network_info.dart';
import 'category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryApi _api;
  final NetworkInfo _info;
  CategoryRepoImpl(this._api, this._info);

  @override
  Future<Either<Failure, List<Category>>> categories() async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.categories();

        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<Failure, List<SubCategory>>> subCategories(int id) async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.subCategories(id);
        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<Failure, UploadDocumentsResponse>> uploadDocument(
    UploadDocumentRequest request, {
    void Function(int, int)? onSentProgress,
  }) async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.uploadDocument(
          request,
          onSentProgress: onSentProgress,
        );
        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<Failure, ExpertAvatar>> changeAvatar(
      UpdateAvatarRequest request) async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.changeAvatar(request);
        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<Failure, UploadDocumentsResponse>> uploadVideo(
    UploadVideoRequest request, {
    void Function(int, int)? onSentProgress,
  }) async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.uploadVideo(
          request,
          onSentProgress: onSentProgress,
        );
        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<Failure, LanguagesResponse>> languges() async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.getLanguges();
        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<Failure, ProfessionsResponse>> proffisions() async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.getProffisions();
        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<Failure, AddAccountResponse>> addAccount(
      RequestExpertRequest request) async {
    //check if there is internet connection
    if (await _info.check) {
      try {
        var response = await _api.addAccount(request);
        return Right(response);
      } catch (error) {
        return Left(Handler.handle(error).failure);
      }
    } else {
      //return if there is no internet connection
      return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
    }
  }
}
