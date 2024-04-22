import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Edit_Org_Profile/Screens/org_text_field.dart';

class EditOrgBody extends StatelessWidget {
  const EditOrgBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [OrgEditTextFrom()],
      ),
    );
  }
}
