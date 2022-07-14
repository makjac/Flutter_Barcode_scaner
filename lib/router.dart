import 'package:barcode_scaner/bloc/barcode_bloc.dart';
import 'package:barcode_scaner/data/repository.dart';
import 'package:flutter/material.dart';

import 'package:barcode_scaner/Constans/strings.dart';
import 'package:barcode_scaner/Screen/screens_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  BarcodeRepository? repository;

  AppRouter() {
    repository = BarcodeRepository();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PAGE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      BarcodeBloc(repository: repository!),
                  child: const HomePage(),
                ));

      case SCAN_PAGE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      BarcodeBloc(repository: repository!),
                  child: const ScanerPage(),
                ));
      default:
        return null;
    }
  }
}
