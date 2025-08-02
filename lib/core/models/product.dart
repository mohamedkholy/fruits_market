import 'package:fruits_market/core/models/product_add_on.dart';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double discount;
  final String description;
  final bool isAvailable;
  final String category;
  final double rating;
  final String sellPer;
  final List<String> availableWeights;
  final List<ProductAddOn> addOns;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.description,
    required this.isAvailable,
    required this.category,
    required this.rating,
    required this.sellPer,
    required this.availableWeights,
    required this.addOns,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      description: json['description'],
      isAvailable: json['is_available'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      sellPer: json['sell_per'],
      availableWeights: List<String>.from(json['available_weights']),
      addOns: (json['add_ons'] as List)
          .map((e) => ProductAddOn.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_url': imageUrl,
        'price': price,
        'discount': discount,
        'description': description,
        'is_available': isAvailable,
        'category': category,
        'rating': rating,
        'sell_per': sellPer,
        'available_weights': availableWeights,
        'add_ons': addOns.map((e) => e.toJson()).toList(),
      };

  double get discountedPrice => price - (price * discount / 100);
}