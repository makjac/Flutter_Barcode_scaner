import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:barcode_scaner/router.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(BarcodeScanerApp(
    router: AppRouter(),
  ));
}

class BarcodeScanerApp extends StatelessWidget {
  final AppRouter router;

  const BarcodeScanerApp({
    Key? key,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
