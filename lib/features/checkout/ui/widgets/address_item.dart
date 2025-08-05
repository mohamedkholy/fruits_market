import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/address.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';

class AddressItem extends StatelessWidget {
  final Address address;
  final void Function(String?) onRadioChanged;
  final String groupValue;
  const AddressItem({
    super.key,
    required this.address,
    required this.onRadioChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(address.title, style: MyTextStyles.font16BoldBlack),
                ],
              ),
              Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: address.title,
                groupValue: groupValue,
                onChanged: onRadioChanged,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(address.contactName),
          const SizedBox(height: 3),
          Text(address.phoneNumber),
          const SizedBox(height: 3),
          Text(address.fullAddress),
        ],
      ),
    );
  }
}
