import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/features/order_tracking/ui/widgets/timeline_tile_with_description.dart';

class OrderStatusTimelineLayout extends StatelessWidget {
  const OrderStatusTimelineLayout({super.key, required this.order});
  final Order order;
  final List<OrderStatus> orderStatuses = const [
    OrderStatus.placed,
    OrderStatus.confirmed,
    OrderStatus.shipped,
    OrderStatus.delivering,
    OrderStatus.delivered,
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 850;
    final orderPosition = orderStatuses.indexWhere(
      (element) => element.displayName == order.status.displayName,
    );
    final children = <Widget>[
      for (int i = orderStatuses.length - 1; i >= 0; i--)
        TimelineTileWithDescription(
          status: orderStatuses[i],
          isLast: i == 0,
          isFirst: i == orderStatuses.length - 1,
          isFinished: orderPosition >= i,
          isEqual: orderPosition == i,
          isWide: isWide,
        ),
    ];

    return isWide
        ? Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height > 500 ? 100 : 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          )
        : Column(children: children);
  }
}
