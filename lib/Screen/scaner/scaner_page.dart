import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class ScanerPage extends StatelessWidget {
  const ScanerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Scanner"),
          centerTitle: true,
        ),
        body: _scaner(),
      ),
    );
  }
}

Widget _scaner() {
  return QRBarScannerCamera(
    onError: ((context, error) => Center(
          child: Text(
            error.toString(),
            style: const TextStyle(color: Colors.red, fontSize: 20),
          ),
        )),
    qrCodeCallback: (code) {
      if (code != null) {
        print(code);
      }
    },
    fit: BoxFit.fill,
    child: _scaningBox(),
  );
}

Widget _scaningBox() {
  const boxSize = 200.0;

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Scan barcode",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: boxSize,
          width: boxSize,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 3),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ],
    ),
  );
}
