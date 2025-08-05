import 'package:fruits_market/core/models/order_status.dart';

class Order {
  final String orderId;
  final double totalPrice;
  final DateTime orderDate;
  final int itemCount;
  final OrderStatus status;

  const Order({
    required this.orderId,
    required this.totalPrice,
    required this.orderDate,
    required this.itemCount,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'],
      totalPrice: (json['total_price'] as num).toDouble(),
      orderDate: DateTime.parse(json['order_date']),
      itemCount: json['item_count'],
      status: OrderStatusExtension.fromString(json['status']),
    );
  }

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'total_price': totalPrice,
        'order_date': orderDate.toIso8601String(),
        'item_count': itemCount,
        'status': status.displayName,
      };
}