import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class CheckoutProgress extends StatelessWidget {
  final int step;
  const CheckoutProgress({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            children: [
              _buildStepIndicator(isSelected: step >= 1),
              Expanded(
                child: DottedLine(
                  dashColor: step >= 2
                      ? MyColors.primaryColor
                      : Colors.grey.shade400,
                ),
              ),
              _buildStepIndicator(isSelected: step >= 2),
              Expanded(
                child: DottedLine(
                  dashColor: step >= 3
                      ? MyColors.primaryColor
                      : Colors.grey.shade400,
                ),
              ),
              _buildStepIndicator(isSelected: step >= 3),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.start,
                  "Delivery time",
                  style: MyTextStyles.font16RegularBlack.copyWith(
                    color: step >= 1
                        ? MyColors.primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  "Delivery Address",
                  style: MyTextStyles.font16RegularBlack.copyWith(
                    color: step >= 2
                        ? MyColors.primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.end,
                  "Payment",
                  style: MyTextStyles.font16RegularBlack.copyWith(
                    color: step >= 3
                        ? MyColors.primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(height: 1, color: Colors.grey.shade300),
      ],
    );
  }

  Widget _buildStepIndicator({required bool isSelected}) {
    final color = isSelected ? MyColors.primaryColor : Colors.grey.shade400;
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
