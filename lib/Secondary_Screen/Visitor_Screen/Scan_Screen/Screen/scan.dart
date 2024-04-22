import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanS extends StatefulWidget {
  const ScanS({super.key});

  @override
  State<ScanS> createState() => _ScanSState();
}

class _ScanSState extends State<ScanS> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var scanArea = (size.width < 400 || size.height < 400) ? 150.0 : 233.0;

    return Container(
      height: size.height,
      width: size.width,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: primaryColor,
          borderRadius: 10,
          borderLength: 80,
          borderWidth: 4,
          cutOutSize: scanArea,
        ),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }
}
