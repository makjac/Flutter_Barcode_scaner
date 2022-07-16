import 'package:barcode_scaner/data/repository.dart';
import 'package:barcode_scaner/screen/scaner/scaner_page.dart';
import 'package:flutter/material.dart';

import 'package:barcode_scaner/Constans/strings.dart';

import 'Screen/home/home_page.dart';

class AppRouter {
  BarcodeRepository? repository;

  AppRouter() {
    repository = BarcodeRepository();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                HomePage(repository: repository!));

      case SCAN_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ScanerPage(repository: repository!));
      default:
        return null;
    }
  }
}
