import 'package:dartz/dartz.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/recipe/data/data_sources/random_recipe_data_source.dart';
import 'package:recipes/features/recipe/domain/repositories/random_recipe_repository.dart';

import '../../../../core/network/error_model.dart';
import '../dto/recipe_model.dart';

class RandomRecipeRepositoryImpl implements RandomRecipeRepository {
  RandomRecipeRepositoryImpl({
    required this.dataSource,
  });

  final RandomRecipeDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<Recipe>>> recipe() async {
    return await dataSource.recipe().guard((data) {
      List<Recipe> recipe = (data["drinks"] as List<dynamic>)
          .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
          .toList();
      return recipe;
    });
  }
}
