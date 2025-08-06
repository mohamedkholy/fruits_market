import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';

class TermsConditionsLayout extends StatelessWidget {
  const TermsConditionsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Terms & Conditions"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
            child: const Column(
              children: [
                Text(
                  "A Terms and Conditions agreement acts as a legal contract between you (the company) and the user. It's where you maintain your rights to exclude users from your app in the event that they abuse your website/app, set out the rules for using your service, and note other important details and disclaimers. Having a Terms and Conditions agreement is completely optional. No laws require you to have one, not even the super-strict and wide-reaching General Data Protection Regulation (GDPR).",
                  style: MyTextStyles.font16MediumBlack,
                ),
                SizedBox(height: 32),
                Text(
                  "Your Terms and Conditions agreement will be uniquely yours. While some clauses are standard and commonly seen in pretty much every Terms and Conditions agreement, it's up to you to set the rules and guidelines that the user must agree to.",
                  style: MyTextStyles.font16MediumBlack,
                ),
                SizedBox(height: 32),
                Text(
                  "Terms and Conditions agreements are also known as Terms of Service or Terms of Use agreements. These terms are interchangeable, practically speaking. More rarely, it may be called something like an End User Services Agreement (EUSA).",
                  style: MyTextStyles.font16MediumBlack,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
