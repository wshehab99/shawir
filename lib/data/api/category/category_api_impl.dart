import 'package:dio/dio.dart';
import 'package:shawir/data/dio/methods.dart';
import 'package:shawir/domain/models/category.dart';
import 'package:shawir/domain/models/sub_category.dart';

import '../../../config/api.dart';
import '../../../config/app.dart';
import 'category_api.dart';

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
}
