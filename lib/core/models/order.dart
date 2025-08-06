import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/core/models/payment_method.dart';

class Order {
  final String id;
  final DateTime date;
  final int itemCount;
  final double totalAmount;
  final OrderStatus status;
  final PaymentMethod paymentMethod;

  Order({
    required this.id,
    required this.date,
    required this.itemCount,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      date: DateTime.parse(json['date']),
      itemCount: json['item_count'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      status: OrderStatusExtension.fromString(json['status']),
      paymentMethod: PaymentMethodExtension.fromString(json['payment_method']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'item_count': itemCount,
        'total_amount': totalAmount,
        'status': status.displayName,
        'payment_method': paymentMethod.displayName,
      };
}