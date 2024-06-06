import 'package:dartz/dartz.dart';

import 'package:shawir/app/exceptions/failure.dart';

import 'package:shawir/domain/models/category.dart';

import 'package:shawir/domain/models/sub_category.dart';

import '../../../app/exceptions/handler.dart';
import '../../../config/error_data_source.dart';
import '../../../data/api/category/category_api.dart';
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
      // try {
      var response = await _api.categories();

      return Right(response);
      // } catch (error) {
      //   return Left(Handler.handle(error).failure);
      // }
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
}
