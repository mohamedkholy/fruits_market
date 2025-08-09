import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_market/core/helpers/countries_codes.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class MyPhoneNumberFormField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const MyPhoneNumberFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });

  @override
  State<MyPhoneNumberFormField> createState() => _MyPhoneNumberFormFieldState();
}

class _MyPhoneNumberFormFieldState extends State<MyPhoneNumberFormField> {
  final TextEditingController _controller = TextEditingController();
  String _selectedCountryIsoCode = 'EG';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: MyTextStyles.font14RegularlightGrey,
              ),
              const TextSpan(
                text: " *",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            if (PhoneNumber.parse(
                  countryToPhoneCode[_selectedCountryIsoCode]! + value,
                ).isValid() ==
                false) {
              return 'Please enter a valid phone number';
            }

            return null;
          },
          onChanged: (value) => setState(() {
            widget.controller.value = TextEditingValue(
              text: PhoneNumber.parse(
                countryToPhoneCode[_selectedCountryIsoCode]! + value,
              ).international,
            );
          }),
          controller: _controller,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 18),
                DropdownButtonHideUnderline(
                  child: Row(
                    children: [
                      const RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          size: 20,
                          Icons.arrow_back_ios_outlined,
                          color: MyColors.lightGrey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        dropdownColor: Colors.white,
                        icon: const SizedBox.shrink(),
                        value: _selectedCountryIsoCode,
                        items: countryToPhoneCode.keys.map((String key) {
                          return DropdownMenuItem<String>(
                            value: key,
                            child: Text(
                              '${countryCodeToEmoji(key)} ${countryToPhoneCode[key]!}',
                              style: MyTextStyles.font17RegularGrey,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue == null) return;
                            _selectedCountryIsoCode = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 3),
                Container(width: 1, height: 24, color: MyColors.lightGrey),
                const SizedBox(width: 8),
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            focusedBorder: _buildBorder(MyColors.primaryColor),
            enabledBorder: _buildBorder(Colors.grey.shade300),
            errorBorder: _buildBorder(Colors.red),
            focusedErrorBorder: _buildBorder(Colors.red),
            hintText: widget.hintText,
            hintStyle: MyTextStyles.font15RegularGrey,
          ),
        ),
      ],
    );
  }

  InputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
