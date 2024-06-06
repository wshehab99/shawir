import 'package:shawir/data/dio/methods.dart';
import 'package:shawir/domain/models/sub_category.dart';
import '../../../domain/models/category.dart';
import 'category_api_impl.dart';

abstract class CategoryApi {
  factory CategoryApi(DioMethods dio) = CategoryApiImpl;
  Future<List<Category>> categories();
  Future<List<SubCategory>> subCategories(int id);
}
