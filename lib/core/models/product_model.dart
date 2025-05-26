class ProductModel {
  String productName;
  String description;
  String tag;
  String category;
  int views;
  String sellerName;
  bool isFavorite;
  List<String> imagesPaths;
  double oldPrice;
  double newPrice;

  ProductModel({
    required this.productName,
    required this.description,
    required this.tag,
    required this.category,
    required this.views,
    required this.sellerName,
    required this.isFavorite,
    required this.imagesPaths,
    required this.oldPrice,
    required this.newPrice,
  });
}
