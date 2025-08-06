import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/validator.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class MyTextFormField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final bool isRequired;
  const MyTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.maxLines,
    this.contentPadding,
    this.isRequired = true,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  late bool _isObscured = widget.isPassword!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.title, style: MyTextStyles.font14RegularlightGrey),
            if (widget.isRequired)
              const Text(" *", style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: widget.maxLines ?? 1,
          validator:
              widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  if (widget.isRequired) {
                    return 'Please enter the ${widget.title.toLowerCase()}';
                  } else {
                    return null;
                  }
                }
                if (widget.isPassword == true &&
                    !Validator.isValidPassword(value)) {
                  return "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character";
                }
                if (value.length < 5 && widget.isRequired) {
                  return "Please enter a valid ${widget.title.toLowerCase()}";
                }
                return null;
              },
          controller: widget.controller,
          obscureText: _isObscured,
          decoration: InputDecoration(
            suffixIcon: !widget.isPassword!
                ? null
                : IconButton(
                    icon: _isObscured
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 18),
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
