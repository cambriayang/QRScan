import 'package:flutter/material.dart';
import 'package:qrscan_app/qrscan_home_page.dart';
import 'package:qrscan_app/scan_qr.dart';
import 'package:qrscan_app/test_home_page.dart';

import 'generate_qr.dart';

void main() {
  runApp(QRScanApp());
}

class QRScanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '二维码扫描工具',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QRScanHomePage(title: '二维码扫描工具'),
      routes: {
        "generate_qr": (context) => GenerateQR(),
        "QRScanTypeQRScan": (context) => ScanQR(
              qrScan: QRScanType.QRScanTypeQRScan,
            ),
        "QRScanTypeBarcodeScan": (context) => ScanQR(
              qrScan: QRScanType.QRScanTypeBarcodeScan,
            ),
        "TestRouter": (context) => TestHomePage(),
      },
    );
  }
}
