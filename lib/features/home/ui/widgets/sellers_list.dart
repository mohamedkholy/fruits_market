import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/seller.dart';
import 'package:fruits_market/features/home/ui/widgets/seller_item.dart';

class SellersList extends StatefulWidget {
  const SellersList({super.key});

  @override
  State<SellersList> createState() => _SellersListState();
}

class _SellersListState extends State<SellersList> {
  final sellers = const [
    Seller(
      id: 's1',
      name: 'Burger Palace',
      imageUrl: 'https://example.com/images/burger_palace.jpg',
      rating: 4.7,
      isOpen: true,
      categories: ['Burgers', 'Fries'],
      deliveryFee: 2.5,
      mainProduct: 'burgers',
      deliveryTime: '30-40 min',
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
      deliveryTime: '25-35 min',
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
      deliveryTime: '40-50 min',
    ),
    const Seller(
      id: 's4',
      name: 'Vegan Delight',
      imageUrl: 'https://example.com/images/vegan_delight.jpg',
      rating: 4.6,
      isOpen: true,
      categories: ['Vegan', 'Salads'],
      deliveryFee: 2.0,
      mainProduct: 'salads',
      deliveryTime: '20-30 min',
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
