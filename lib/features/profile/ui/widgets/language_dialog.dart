import 'package:flutter/material.dart';
import 'package:fruits_market/core/helpers/countries_codes.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  final List<String> languages = ["Arabic", "English"];
  late String groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = languages[0];
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Language", style: MyTextStyles.font18BoldBlack),
            ...[
              "${countryCodeToEmoji("sa")} Arabic",
              " ${countryCodeToEmoji("us")} English",
            ].asMap().entries.map(
              (e) => ListTile(
                leading: Transform.scale(
                  scale: 1.2,
                  child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: languages[e.key],
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value.toString();
                      });
                    },
                  ),
                ),
                title: Text(e.value, style: MyTextStyles.font16RegularBlack),
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: .8,
              child: MyButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Apply",
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text("Close", style: MyTextStyles.font16MediumGrey),
            ),
          ],
        ),
      ),
    );
  }
}
