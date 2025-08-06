import 'package:flutter/material.dart';

class ContactMethodsRow extends StatelessWidget {
  const ContactMethodsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          {
                Icons.facebook_outlined: Colors.blue,
                Icons.phone_outlined: Colors.green,
                const IconData(0xf167, fontFamily: "youtube_icon"): Colors.red,
                const IconData(0xf16d, fontFamily: "instagram_icon"):
                    Colors.pink,
              }.entries
              .map(
                (entry) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Icon(entry.key, color: entry.value, size: 28),
                ),
              )
              .toList(),
    );
  }
}
