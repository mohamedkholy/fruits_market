import 'package:fruits_market/core/models/product.dart';

class BasketItem {
  final Product product;
  final int quantity;

  const BasketItem({required this.product, required this.quantity});
}
