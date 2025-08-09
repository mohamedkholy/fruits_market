import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class OrderStatusRichText extends StatelessWidget {
  final bool isWide;
  final OrderStatus status;
  const OrderStatusRichText({
    super.key,
    required this.status,
    required this.isWide,
  });

  final Map<OrderStatus, Map<String, String>> orderStatusDetails = const {
    OrderStatus.placed: {
      "title": "Placed",
      "description": "We have received your order",
    },
    OrderStatus.confirmed: {
      "title": "Confirmed",
      "description": "Your order has been confirmed",
    },
    OrderStatus.shipped: {
      "title": "Order shipped",
      "description": "Estimated for 10 September, 2021",
    },
    OrderStatus.delivering: {
      "title": "Out for delivery",
      "description": "Your order is on the way",
    },
    OrderStatus.delivered: {
      "title": "Delivered",
      "description": "Your order has been successfully delivered",
    },
    OrderStatus.canceled: {
      "title": "Canceled",
      "description": "Your order has been canceled",
    },
  };

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: isWide ? TextAlign.center : TextAlign.start,
      text: TextSpan(
        text: "${orderStatusDetails[status]!["title"]}\n",
        style: MyTextStyles.font21BoldPrimary,
        children: [
          if (MediaQuery.sizeOf(context).width < 850)
            TextSpan(
              text: orderStatusDetails[status]!["description"],
              style: MyTextStyles.font18RegularGrey,
            ),
        ],
      ),
    );
  }
}
