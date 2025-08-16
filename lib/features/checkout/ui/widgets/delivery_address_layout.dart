import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/address.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/shadow_container.dart';
import 'package:fruits_market/features/checkout/ui/widgets/address_item.dart';

class DeliveryAddressLayout extends StatefulWidget {
  const DeliveryAddressLayout({super.key});

  @override
  State<DeliveryAddressLayout> createState() => _DeliveryAddressLayoutState();
}

class _DeliveryAddressLayoutState extends State<DeliveryAddressLayout> {
  String groupValue = "";
  final List<Address> addresses = const [
    Address(
      title: "Home",
      contactName: "John Doe",
      phoneNumber: "+000-11-1234567",
      fullAddress:
          "Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates",
      apartment: "Room # 1 - Ground Floor",
      building: "Al Najoum Building",
      street: "24 B Street",
      city: "Dubai",
      country: "United Arab Emirates",
    ),
    Address(
      title: "Work",
      contactName: "Jane Smith",
      phoneNumber: "+000-22-9876543",
      fullAddress:
          "Office 205, Business Tower, Sheikh Zayed Road, Dubai - United Arab Emirates",
      apartment: "Office 205",
      building: "Business Tower",
      street: "Sheikh Zayed Road",
      city: "Dubai",
      country: "United Arab Emirates",
    ),
    Address(
      title: "Friend",
      contactName: "Ahmed Ali",
      phoneNumber: "+000-33-7654321",
      fullAddress:
          "Apartment 10B, Marina Heights, Al Marsa Street, Abu Dhabi - United Arab Emirates",
      apartment: "Apartment 10B",
      building: "Marina Heights",
      street: "Al Marsa Street",
      city: "Abu Dhabi",
      country: "United Arab Emirates",
    ),
    Address(
      title: "Vacation Home",
      contactName: "Sarah Khan",
      phoneNumber: "+000-44-5553331",
      fullAddress:
          "Villa 12, Palm Jumeirah Crescent, Dubai - United Arab Emirates",
      apartment: "Villa 12",
      building: "Palm Jumeirah Crescent",
      street: "",
      city: "Dubai",
      country: "United Arab Emirates",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadowContainer(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add New Address",
                    style: MyTextStyles.font16BoldBlack,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 28),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(addresses.length, (index) {
              return AddressItem(
                address: addresses[index],
                onRadioChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
                groupValue: groupValue,
              );
            }),
          ],
        ),
      ),
    );
  }
}
