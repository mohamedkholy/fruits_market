import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_item.dart';

class SellersList extends StatefulWidget {
  const SellersList({super.key});

  @override
  State<SellersList> createState() => _SellersListState();
}

class _SellersListState extends State<SellersList> {
  final List<Seller> sellers = const [
    Seller(
      id: 's1',
      name: 'Burger Palace',
      imageUrl: 'https://example.com/images/burger_palace.jpg',
      rating: 4.7,
      isOpen: true,
      categories: ['Burgers', 'Fries'],
      deliveryFee: 2.5,
      mainProduct: 'burgers',
    ),
    Seller(
      id: 's2',
      name: 'Pizza Hub',
      imageUrl: 'https://example.com/images/pizza_hub.jpg',
      rating: 4.5,
      isOpen: false,
      categories: ['Pizza', 'Pasta'],
      deliveryFee: 3.0,
      mainProduct: 'pizza',
    ),
    Seller(
      id: 's3',
      name: 'Sushi Corner',
      imageUrl: 'https://example.com/images/sushi_corner.jpg',
      rating: 4.8,
      isOpen: true,
      categories: ['Sushi', 'Seafood'],
      deliveryFee: 4.0,
      mainProduct: 'sushi',
    ),
    Seller(
      id: 's4',
      name: 'Vegan Delight',
      imageUrl: 'https://example.com/images/vegan_delight.jpg',
      rating: 4.6,
      isOpen: true,
      categories: ['Vegan', 'Salads'],
      deliveryFee: 2.0,
      mainProduct: 'salads',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => SellerItem(seller: sellers[index]),
        childCount: sellers.length,
      ),
    );
  }
}
