import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Widgets/button.dart';

class UpdateCheckScreen extends StatefulWidget {
  @override
  _UpdateCheckScreenState createState() => _UpdateCheckScreenState();
}

class _UpdateCheckScreenState extends State<UpdateCheckScreen> {
  String currentVersion = '';

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
  }

  Future<void> _getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      currentVersion = packageInfo.version;
    });
  }

  // Add your logic to check for updates from a server
  bool _isNewVersionAvailable() {
    // Replace this logic with your version check
    String latestVersion = '1.2.0';
    return latestVersion != currentVersion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppImages.appbarLogo),
            SizedBox(height: 20,),
            Text(
              'Current Version: $currentVersion',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            if (_isNewVersionAvailable())
              DefaultButton(
              text: "Update Now",
              press: (){},)
              // ElevatedButton(
              //   onPressed: () {
              //     // Open the Play Store or your update page
              //     // Example: launch('https://play.google.com/store/apps/details?id=your.package.name');
              //   },
              //   child: Text('Update Now'),
              // )
            else
              Text('You are using the latest version!'),
          ],
        ),
      ),
    );
  }
}
