import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/models/product_add_on.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/favorites/ui/widgets/favorites_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  final List<Product> sampleProducts = const [
    Product(
      sellerName: "Pizza Hub",
      sellerId: "s2",
      id: 'p1',
      name: 'Pizza Margherita',
      imageUrl: 'https://example.com/images/pizza.jpg',
      price: 10.0,
      discount: .15,
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
      sellerName: "Sushi Corner",
      sellerId: "s3",
      id: 'p2',
      name: 'Sushi Platter',
      imageUrl: 'https://example.com/images/sushi.jpg',
      price: 25.0,
      discount: .10,
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
      sellerName: "Burger Palace",
      sellerId: "s1",
      id: 'p3',
      name: 'Grilled Chicken Sandwich',
      imageUrl: 'https://example.com/images/chicken_sandwich.jpg',
      price: 8.0,
      discount: .5,
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
      sellerName: "Burger Palace",
      sellerId: "s1",
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
      sellerName: "Vegan Delight",
      sellerId: "s4",
      id: 'p5',
      name: 'Caesar Salad',
      imageUrl: 'https://example.com/images/salad.jpg',
      price: 7.5,
      discount: .4,
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
      sellerName: "Vegan Delight",
      sellerId: "s4",
      id: 'p6',
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
      sellerName: "Vegan Delight",
      sellerId: "s4",
      id: 'p7',
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
      sellerName: "Vegan Delight",
      sellerId: "s4",
      id: 'p8',
      name: 'Caesar Salad',
      imageUrl: 'https://example.com/images/salad.jpg',
      price: 7.5,
      discount: .5,
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
      sellerName: "Vegan Delight",
      sellerId: "s4",
      id: 'p9',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: MyTextStyles.font24BoldPrimary),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MediaQuery.of(context).size.width < 800
                  ? ListView.builder(
                      itemCount: sampleProducts.length,
                      itemBuilder: (context, index) {
                        return FavoritesItem(product: sampleProducts[index]);
                      },
                    )
                  : SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            2,
                            (index) => Expanded(
                              child: Column(
                                children: [
                                  for (
                                    int i = index;
                                    i < sampleProducts.length;
                                    i += 2
                                  )
                                    FavoritesItem(product: sampleProducts[i]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
