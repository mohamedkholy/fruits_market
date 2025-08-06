import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/orders/ui/widgets/order_details_column.dart';

class OrderItemLayout extends StatelessWidget {
  const OrderItemLayout({super.key, required this.order});

  final Order order;

  final Map<OrderStatus, Map<String, dynamic>> statusStyles = const {
    OrderStatus.delivering: {
      'color': Colors.orange,
      'icon': Icons.local_shipping,
    },
    OrderStatus.shipped: {'color': Colors.green, 'icon': Icons.check_circle},
    OrderStatus.canceled: {'color': Colors.red, 'icon': Icons.cancel},
    OrderStatus.confirmed: {'color': Colors.blue, 'icon': Icons.work},
    OrderStatus.delivered: {'color': Colors.teal, 'icon': Icons.done_all},
    OrderStatus.placed: {'color': Colors.purple, 'icon': Icons.fiber_new},
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRoutes.orderTrackingScreen,
          arguments: order,
        );
      },
      child: ShadowContainer(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: (statusStyles[order.status]!['color'] as Color)
                  .withAlpha(100),
              child: Icon(
                statusStyles[order.status]!['icon'],
                color: statusStyles[order.status]!['color'],
              ),
            ),
            const SizedBox(width: 15),
            OrderDetailsColumn(
              order: order,
              color: statusStyles[order.status]!['color'],
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: (statusStyles[order.status]!['color'] as Color)
                  .withAlpha(200),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
