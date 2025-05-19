class FilterModel {
  String? brandName;
  int? brandIndex;
  String? modelName;
  int? modelIndex;
  String? categoryName;
  int? categoryIndex;
  int? year;

  double? minPrice;
  double? maxPrice;
  FilterModel({
    this.brandName,
    this.brandIndex,
    this.categoryName,
    this.categoryIndex,
    this.modelName,
    this.modelIndex,
    this.year,
    this.minPrice,
    this.maxPrice,
  });
}
