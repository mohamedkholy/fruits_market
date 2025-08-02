import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/models/product_add_on.dart';
import 'package:fruits_market/features/seller/ui/widgets/product_item.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;
  const ProductsList({super.key, required this.products});
  final List<Product> sampleProducts = const [
    Product(
      id: 'p1',
      name: 'Pizza Margherita',
      imageUrl: 'https://example.com/images/pizza.jpg',
      price: 10.0,
      discount: 15,
      description: 'Classic Italian pizza with tomato, mozzarella and basil.',
      isAvailable: true,
      category: 'Pizza',
      rating: 4.8,
      sellPer: 'piece',
      availableWeights: ['Small', 'Medium', 'Large'],
      addOns: [
        ProductAddOn(name: 'Extra Cheese', price: 1.5),
        ProductAddOn(name: 'Olives', price: 0.75),
      ],
    ),
    Product(
      id: 'p2',
      name: 'Sushi Platter',
      imageUrl: 'https://example.com/images/sushi.jpg',
      price: 25.0,
      discount: 10,
      description: 'Assorted sushi platter with fresh ingredients.',
      isAvailable: true,
      category: 'Sushi',
      rating: 4.6,
      sellPer: 'tray',
      availableWeights: ['6 pcs', '12 pcs', '24 pcs'],
      addOns: [
        ProductAddOn(name: 'Extra Wasabi', price: 0.5),
        ProductAddOn(name: 'Soy Sauce', price: 0.3),
      ],
    ),
    Product(
      id: 'p3',
      name: 'Grilled Chicken Sandwich',
      imageUrl: 'https://example.com/images/chicken_sandwich.jpg',
      price: 8.0,
      discount: 5,
      description: 'Juicy grilled chicken sandwich with fresh veggies.',
      isAvailable: false,
      category: 'Sandwiches',
      rating: 4.3,
      sellPer: 'piece',
      availableWeights: ['Regular', 'Large'],
      addOns: [
        ProductAddOn(name: 'Extra Mayo', price: 0.5),
        ProductAddOn(name: 'Fries Combo', price: 2.0),
      ],
    ),
    Product(
      id: 'p4',
      name: 'Chocolate Milkshake',
      imageUrl: 'https://example.com/images/milkshake.jpg',
      price: 5.0,
      discount: 0,
      description: 'Thick chocolate milkshake made with real cocoa.',
      isAvailable: true,
      category: 'Drinks',
      rating: 4.7,
      sellPer: 'cup',
      availableWeights: ['250ml', '500ml'],
      addOns: [
        ProductAddOn(name: 'Whipped Cream', price: 0.5),
        ProductAddOn(name: 'Extra Chocolate', price: 0.75),
      ],
    ),
    Product(
      id: 'p5',
      name: 'Caesar Salad',
      imageUrl: 'https://example.com/images/salad.jpg',
      price: 7.5,
      discount: 0,
      description: 'Fresh Caesar salad with parmesan and croutons.',
      isAvailable: true,
      category: 'Salads',
      rating: 4.5,
      sellPer: 'box',
      availableWeights: ['Small', 'Medium', 'Large'],
      addOns: [
        ProductAddOn(name: 'Grilled Chicken', price: 2.0),
        ProductAddOn(name: 'Boiled Egg', price: 1.0),
      ],
    ),
    Product(
      id: 'p5',
      name: 'Caesar Salad',
      imageUrl: 'https://example.com/images/salad.jpg',
      price: 7.5,
      discount: 0,
      description: 'Fresh Caesar salad with parmesan and croutons.',
      isAvailable: true,
      category: 'Salads',
      rating: 4.5,
      sellPer: 'box',
      availableWeights: ['Small', 'Medium', 'Large'],
      addOns: [
        ProductAddOn(name: 'Grilled Chicken', price: 2.0),
        ProductAddOn(name: 'Boiled Egg', price: 1.0),
      ],
    ),
    Product(
      id: 'p5',
      name: 'Caesar Salad',
      imageUrl: 'https://example.com/images/salad.jpg',
      price: 7.5,
      discount: 0,
      description: 'Fresh Caesar salad with parmesan and croutons.',
      isAvailable: true,
      category: 'Salads',
      rating: 4.5,
      sellPer: 'box',
      availableWeights: ['Small', 'Medium', 'Large'],
      addOns: [
        ProductAddOn(name: 'Grilled Chicken', price: 2.0),
        ProductAddOn(name: 'Boiled Egg', price: 1.0),
      ],
    ),
    Product(
      id: 'p5',
      name: 'Caesar Salad',
      imageUrl: 'https://example.com/images/salad.jpg',
      price: 7.5,
      discount: 0,
      description: 'Fresh Caesar salad with parmesan and croutons.',
      isAvailable: true,
      category: 'Salads',
      rating: 4.5,
      sellPer: 'box',
      availableWeights: ['Small', 'Medium', 'Large'],
      addOns: [
        ProductAddOn(name: 'Grilled Chicken', price: 2.0),
        ProductAddOn(name: 'Boiled Egg', price: 1.0),
      ],
    ),
    Product(
      id: 'p5',
      name: 'Caesar Salad',
      imageUrl: 'https://example.com/images/salad.jpg',
      price: 7.5,
      discount: 0,
      description: 'Fresh Caesar salad with parmesan and croutons.',
      isAvailable: true,
      category: 'Salads',
      rating: 4.5,
      sellPer: 'box',
      availableWeights: ['Small', 'Medium', 'Large'],
      addOns: [
        ProductAddOn(name: 'Grilled Chicken', price: 2.0),
        ProductAddOn(name: 'Boiled Egg', price: 1.0),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProductItem(product: sampleProducts[index]),
        childCount: sampleProducts.length,
      ),
    );
  }
}
