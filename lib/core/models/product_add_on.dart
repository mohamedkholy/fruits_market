class ProductAddOn {
  final String name;
  final double price;

  const ProductAddOn({
    required this.name,
    required this.price,
  });

  factory ProductAddOn.fromJson(Map<String, dynamic> json) {
    return ProductAddOn(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
}