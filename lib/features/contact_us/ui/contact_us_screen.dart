import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/my_phone_number_form_field.dart';
import 'package:fruits_market/core/widgets/my_text_form_field.dart';
import 'package:fruits_market/features/contact_us/ui/widgets/contact_methods_row.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsLayoutState();
}

class _ContactUsLayoutState extends State<ContactUsScreen> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _mobileTextController = TextEditingController();
  final TextEditingController _messageTextController = TextEditingController();
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _messageFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _mobileTextController.dispose();
    _messageTextController.dispose();
    _formKey.currentState?.dispose();
    _mobileFocusNode.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Contact Us"),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFormField(
                        title: "name",
                        hintText: "name",
                        controller: _nameTextController,
                        onFieldSubmitted: (value) {
                          _mobileFocusNode.requestFocus();
                        },
                      ),
                      const SizedBox(height: 24),
                      MyPhoneNumberFormField(
                        title: "mobile",
                        hintText: "mobile",
                        controller: _mobileTextController,
                        focusNode: _mobileFocusNode,
                        onFieldSubmitted: (value) {
                          _messageFocusNode.requestFocus();
                        },
                      ),
                      const SizedBox(height: 24),
                      MyTextFormField(
                        title: "message",
                        hintText: "message",
                        controller: _messageTextController,
                        focusNode: _messageFocusNode,
                        maxLines: 5,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 15,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "message is required";
                          }
                          if (value.length < 10) {
                            return "message must be at least 10 characters long";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      MyButton(
                        text: "Submit",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                      const SizedBox(height: 24),
                      const ContactMethodsRow(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
