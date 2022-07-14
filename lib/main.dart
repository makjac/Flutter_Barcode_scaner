// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_scaner/bloc/barcode_bloc.dart';
import 'package:barcode_scaner/data/repository.dart';
import 'package:flutter/material.dart';

import 'package:barcode_scaner/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

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
