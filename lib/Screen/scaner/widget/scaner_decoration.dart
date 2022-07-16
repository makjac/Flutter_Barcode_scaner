import 'package:flutter/material.dart';

class ScanerDecoration extends StatelessWidget {
  static const boxSize = 200.0;
  const ScanerDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
