import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/models/product_add_on.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/basket/data/models/basket_item.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  final List<BasketItem> sampleBasketItems = const [
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
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
      quantity: 2,
    ),
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
        id: 'p2',
        name: 'Sushi Platter',
        imageUrl: 'https://example.com/images/sushi.jpg',
        price: 25.0,
        discount: .1,
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
      quantity: 4,
    ),
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
        id: 'p3',
        name: 'Grilled Chicken Sandwich',
        imageUrl: 'https://example.com/images/chicken_sandwich.jpg',
        price: 8.0,
        discount: .15,
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
      quantity: 1,
    ),
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
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
      quantity: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Order Details", style: MyTextStyles.font16BoldBlack),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("Total items", style: MyTextStyles.font16MediumGrey),
            const Spacer(),
            Text(
              "${sampleBasketItems.length} items",
              style: MyTextStyles.font16BoldBlack,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("Subtotal", style: MyTextStyles.font16MediumGrey),
            const Spacer(),
            Text(
              "${sampleBasketItems.fold(0.0, (previousValue, element) => previousValue + element.product.discountedPrice * element.quantity)}",
              style: MyTextStyles.font16BoldBlack,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Text("Shipping Charges", style: MyTextStyles.font16MediumGrey),
            Spacer(),
            Text("1.5 KD", style: MyTextStyles.font16BoldBlack),
          ],
        ),
        const SizedBox(height: 10),
        Container(height: 1, color: Colors.grey.shade300),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text("Total", style: MyTextStyles.font18BoldPrimary),
            const Spacer(),
            Text(
              "${sampleBasketItems.fold(0.0, (previousValue, element) => previousValue + element.product.discountedPrice * element.quantity + 1.5)}",
              style: MyTextStyles.font18BoldPrimary,
            ),
          ],
        ),
      ],
    );
  }
}
