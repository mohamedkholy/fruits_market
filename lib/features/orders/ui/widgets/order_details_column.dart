import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:intl/intl.dart';

class OrderDetailsColumn extends StatelessWidget {
  final Order order;
  final Color color;
  const OrderDetailsColumn({
    super.key,
    required this.order,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${order.orderId}  -  ${order.totalPrice} KD',
          style: MyTextStyles.font16BoldBlack,
        ),
        Row(
          children: [
            Text(
              DateFormat('d MMM').format(order.orderDate),
              style: MyTextStyles.font16MediumGrey,
            ),
            const SizedBox(width: 10),
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.grey,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${order.itemCount} items',
              style: MyTextStyles.font16MediumGrey,
            ),
          ],
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: "Status: ",
            style: MyTextStyles.font16MediumGrey,
            children: [
              TextSpan(
                text: order.status.displayName,
                style: MyTextStyles.font16MediumPrimary.copyWith(color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
