import 'package:motor/core/models/brand_model.dart';
import 'package:motor/core/models/category_model.dart';

class FilterModel {
  List<BrandModel> selectedBrands;
  List<String> selectedModels;
  List<CategoryModel> selectedCategories;
  int? year;

  double? minPrice;
  double? maxPrice;
  FilterModel({
    this.year,
    this.minPrice,
    this.maxPrice,
    required this.selectedBrands,
    required this.selectedModels,
    required this.selectedCategories,
  });
}
