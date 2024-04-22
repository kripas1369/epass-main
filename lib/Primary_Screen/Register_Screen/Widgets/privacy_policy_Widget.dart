import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: primaryColor,
          value: isClicked,
          onChanged: (newValue) {
            isClicked = newValue!;
            setState(() {});
          },
        ),

        RichText(
          text: TextSpan(
            style: const TextStyle(fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: 'I accept Epass ',
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              TextSpan(
                text: 'Privacy Policy ',
                style: TextStyle(color: primaryColor, fontSize: 12.0),
              ),
              TextSpan(
                text: "&",
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              TextSpan(
                text: ' Terms and Conditions',
                style: TextStyle(color: primaryColor, fontSize: 12.0),
              ),
            ],
          ),
        ),
        // CustomText(text: 'I agree Epass Privacy Policy & Terms and Conditions',),
      ],
    );
  }
}
