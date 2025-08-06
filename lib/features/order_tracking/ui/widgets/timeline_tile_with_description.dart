import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/features/order_tracking/ui/widgets/order_status_rich_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileWithDescription extends StatelessWidget {
  final OrderStatus status;
  final bool isLast;
  final bool isFirst;
  final bool isFinished;
  final bool isEqual;
  final bool isWide;
  const TimelineTileWithDescription({
    super.key,
    required this.status,
    required this.isLast,
    required this.isFirst,
    required this.isFinished,
    required this.isEqual,
    required this.isWide,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      SizedBox(
        width: isWide ? 150 : 50,
        height: isWide ? 50 : null,
        child: TimelineTile(
          axis: isWide ? TimelineAxis.horizontal : TimelineAxis.vertical,
          isFirst: isFirst,
          isLast: isLast,
          indicatorStyle: IndicatorStyle(
            drawGap: true,
            width: 28,
            height: 28,
            indicator: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isFinished ? Colors.green : Colors.grey,
                ),
                shape: BoxShape.circle,
                color: isFinished ? Colors.green : Colors.transparent,
              ),
            ),
          ),
          beforeLineStyle: LineStyle(
            color: isFinished && !isEqual ? Colors.green : Colors.grey,
          ),
          afterLineStyle: isEqual ? const LineStyle(color: Colors.green) : null,
        ),
      ),
      isWide
          ? OrderStatusRichText(status: status)
          : Expanded(child: OrderStatusRichText(status: status)),
    ];
    return isWide ? Column(children: children) : Row(children: children);
  }
}
