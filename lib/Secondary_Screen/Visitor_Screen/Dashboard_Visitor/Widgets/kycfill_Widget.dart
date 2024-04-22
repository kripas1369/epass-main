import 'package:flutter/material.dart';
import 'package:pass/routes.dart';

import '../../Service_Login_Details/loginDetailsService.dart';

class KycContainer extends StatelessWidget {
  const KycContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future:
          getLoginprofile(context), // Assuming getLoginprofile returns a Future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator or another widget while waiting for the result
          return Text("");
        } else if (snapshot.hasError) {
          // Handle error case
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          bool isKycVerified = snapshot.data!['is_kyc_verified'] ?? false;
          if (!isKycVerified) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.visitorScreen);
              },
              child: Container(
                width: 382.37,
                height: 58.98,
                decoration: ShapeDecoration(
                  color: Color(0xFFEBF6FF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF0F75BC)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 270,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Take a moment to verify your KYC details to ensure a secure and smooth experience.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xFF090A0A),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        'Fill KYC',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF0F75BC),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0.12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Return an empty container if is_kyc_verified is true
            return Container();
          }
        } else {
          // Handle the case where data is null
          return Text('No data available');
        }
      },
    );
  }
}
