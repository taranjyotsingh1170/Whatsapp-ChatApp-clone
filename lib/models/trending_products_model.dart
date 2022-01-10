class TrendingProductsModel {
  final int id;
  final String image;
  final String name;
  final int amount;
  final int ratings;
  final int reviews;

  const TrendingProductsModel({
    required this.id,
    required this.image,
    required this.name,
    required this.amount,
    required this.ratings,
    required this.reviews,
  });
}
