import 'package:dartz/dartz.dart';
import 'package:shawir/app/exceptions/failure.dart';

import '../../../data/api/category/category_api.dart';
import '../../../data/info/network_info.dart';
import '../../models/category.dart';
import '../../models/sub_category.dart';
import 'category_repo_impl.dart';

abstract class CategoryRepo {
  factory CategoryRepo(CategoryApi api, NetworkInfo info) = CategoryRepoImpl;
  Future<Either<Failure,List<Category>>> categories();
  Future<Either<Failure,List<SubCategory>>> subCategories(int id);
}
