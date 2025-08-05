import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/product.dart';
import 'package:fruits_market/core/models/product_add_on.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/basket/data/models/basket_item.dart';
import 'package:fruits_market/features/basket/ui/widgets/basket_details.dart';
import 'package:fruits_market/features/basket/ui/widgets/basket_item_widget.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
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
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
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
      quantity: 1,
    ),
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
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
      quantity: 1,
    ),
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
        id: 'p5',
        name: 'Caesar Salad',
        imageUrl: 'https://example.com/images/salad.jpg',
        price: 7.5,
        discount: .3,
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
      quantity: 1,
    ),
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
        id: 'p5',
        name: 'Caesar Salad',
        imageUrl: 'https://example.com/images/salad.jpg',
        price: 7.5,
        discount: .2,
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
      quantity: 2,
    ),
    BasketItem(
      product: Product(
        sellerName: "",
        sellerId: "",
        id: 'p5',
        name: 'Caesar Salad',
        imageUrl: 'https://example.com/images/salad.jpg',
        price: 7.5,
        discount: .2,
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
      quantity: 2,
    ),
  ];

  late double subTotal;

  late double shippingCharges;

  late int itemCount;

  @override
  void initState() {
    super.initState();
    subTotal = sampleBasketItems.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.product.price * element.product.discount * element.quantity,
    );
    shippingCharges = 1.5;
    itemCount = sampleBasketItems.fold(
      0,
      (previousValue, element) => previousValue + element.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket", style: MyTextStyles.font24BoldPrimary),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MediaQuery.sizeOf(context).width > 700
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (var basketItem in sampleBasketItems)
                                  BasketItemWidget(basketItem: basketItem),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: BasketDetails(
                            subtotal: subTotal,
                            shippingCharges: shippingCharges,
                            itemCount: itemCount,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  return BasketItemWidget(
                                    basketItem: sampleBasketItems[index],
                                  );
                                }, childCount: sampleBasketItems.length),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, top: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: const DottedLine(
                            dashGapLength: 5,
                            dashColor: Colors.grey,
                          ),
                        ),
                        BasketDetails(
                          subtotal: subTotal,
                          shippingCharges: shippingCharges,
                          itemCount: itemCount,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
