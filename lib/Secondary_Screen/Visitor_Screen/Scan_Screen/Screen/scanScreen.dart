import 'dart:io';

import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/MyQR/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Textfield/formOne.dart';
import 'package:pass/Widgets/button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';

import 'Controller/orgId_QR.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var logger = Logger();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool formScreenOpened =
      false; // Add a flag to track if FormOneScreen is opened

  late CameraController _cameraController;
  late bool _isTorchOn = false;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        orgIdController.setOrgId(scanData.code!);
        logger.d(orgId);
        stdout.writeln(orgId);

        if (orgIdController.orgId.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FormOneScreen(
                orgId: orgIdController.orgId.value,
              ),
            ),
          );
        }
      }
    });
  }

  String? orgId;
  OrgIdController orgIdController = OrgIdController(); // Create an instance

  Future<String?> getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile.path;
    } else {
      return null;
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);

    // Initialize the controller
    await _cameraController.initialize();
  }

  Future<void> _toggleTorch() async {
    try {
      if (!_cameraController.value.isInitialized) {
        return;
      }

      if (_cameraController.value.flashMode == FlashMode.off) {
        await _cameraController.setFlashMode(FlashMode.torch);
      } else {
        await _cameraController.setFlashMode(FlashMode.off);
      }
    } catch (e) {
      print("Error toggling flashlight: $e");
    }
  }

  Future<void> scanQRCodeFromImage(String imagePath) async {
    try {
      String? result = await Scan.parse(imagePath);
      if (result != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormOneScreen(orgId: result!),
            ));
      }

      // Handle the result as needed (e.g., display it in a dialog)
      print("QR Code Result: $result");
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // Handle camera access denied exception
        print("Camera access denied");
      } else {
        // Handle other exceptions
        print("Error: $e");
      }
    } on FormatException {
      // User pressed the back button before scanning anything
      print("User pressed back button");
    } catch (e) {
      // Handle other exceptions
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _isTorchOn = false;

    // Initialize the camera controller
    _initializeCamera();
  }

  // bool isScanClicked = true;
  @override
  Widget build(BuildContext context) {
    var scanArea = 220.0;

    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: primaryColor,
                borderRadius: 10,
                borderLength: scanArea / 2,
                borderWidth: 4,
                cutOutSize: scanArea),
          ),
        ),
        Container(
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/epass.png'),
              SizedBox(
                height: 20,
              ),
              Text(
                "Scan Any QR",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Please align the QR within the frame",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await _toggleTorch();
                    },
                    icon: Icon(
                      Icons.flash_on,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      final image = await getImageFromGallery();
                      if (image != null) {
                        scanQRCodeFromImage(image);
                      }
                    },
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: DefaultButton(
                  text: "Show My QR Code".toUpperCase(),
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyQrScreen(qrcode: AppImages.qrimage),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: Image.asset(AppImages.backIcon),
        ),
      ],
    );
  }
}

class QRCodeReaderTool {
  static String? getQrCode(Image image) {
    // Implement QR code reading logic here
    return null; // Return the decoded data or null if not found
  }
}
