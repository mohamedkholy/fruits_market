class Seller {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final bool isOpen;
  final List<String> categories;
  final double deliveryFee;
  final String mainProduct;
  final String deliveryTime;

  const Seller({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.isOpen,
    required this.categories,
    required this.deliveryFee,
    required this.mainProduct,
    required this.deliveryTime,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      rating: (json['rating'] as num).toDouble(),
      isOpen: json['is_open'],
      categories: List<String>.from(json['categories']),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      mainProduct: json['main_product'],
      deliveryTime: json['delivery_time'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image_url': imageUrl,
    'rating': rating,
    'is_open': isOpen,
    'categories': categories,
    'delivery_fee': deliveryFee,
    'main_product': mainProduct,
    'delivery_time': deliveryTime,
  };
}
