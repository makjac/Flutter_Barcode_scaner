import 'package:barcode_scaner/Screen/home/bloc/home_bloc.dart';
import 'package:barcode_scaner/Screen/scaner/bloc/scaner_bloc.dart';
import 'package:barcode_scaner/data/repository.dart';
import 'package:barcode_scaner/screen/scaner/scaner_page.dart';
import 'package:flutter/material.dart';

import 'package:barcode_scaner/Constans/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screen/home/home_page.dart';

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
                  create: (_) => HomeBloc(repository: repository!)
                    ..add(InitBarcodeBoxEvt()),
                  child: const HomePage(),
                ));

      case SCAN_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ScanerPage(repository: repository!));
      default:
        return null;
    }
  }
}
