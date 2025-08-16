import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/core/widgets/my_phone_number_form_field.dart';
import 'package:fruits_market/core/widgets/my_text_form_field.dart';
import 'package:fruits_market/features/update_profile/ui/widgets/profile_picture.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _mobileFocusNode.dispose();
    _passwordFocusNode.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Update Profile"),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const ProfilePicture(),
                      const SizedBox(height: 40),
                      MyTextFormField(
                        controller: _fullNameController,
                        title: "Full Name",
                        hintText: "First and Last Name",
                        onFieldSubmitted: (p0) =>
                            _mobileFocusNode.requestFocus(),
                      ),
                      const SizedBox(height: 24),
                      MyPhoneNumberFormField(
                        controller: _phoneNumberController,
                        title: "Phone Number with Whatsapp",
                        hintText: "Mobile Number",
                        focusNode: _mobileFocusNode,
                        onFieldSubmitted: (p0) =>
                            _passwordFocusNode.requestFocus(),
                      ),
                      const SizedBox(height: 24),
                      MyTextFormField(
                        controller: _passwordController,
                        title: "Password",
                        hintText: "Enter your password",
                        isPassword: true,
                        focusNode: _passwordFocusNode,
                      ),
                      const SizedBox(height: 60),
                      MyButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        text: "Update",
                      ),
                      const SizedBox(height: 60),
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
