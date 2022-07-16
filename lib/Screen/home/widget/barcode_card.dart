import 'package:barcode_scaner/Screen/home/bloc/home_bloc.dart';
import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarcodeCard extends StatelessWidget {
  final Barcode barcode;
  final int index;

  const BarcodeCard({
    required this.barcode,
    required this.index,
    Key? key,
  }) : super(key: key);

  TextStyle _cardTextStyle() {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }

  String _truncateString(String text) {
    return (text.length >= 17) ? '${text.substring(0, 14)}...' : text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 10),
          CircleAvatar(
            child: Text((index + 1).toString()),
          ),
          const SizedBox(width: 15),
          Text(
            _truncateString(barcode.barcode),
            style: _cardTextStyle(),
          ),
          const Spacer(),
          Text(
            barcode.date.toString().substring(0, 10),
            style: _cardTextStyle(),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(RemoveBarcodeEvt(id: barcode.id));
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.delete_forever),
          )
        ],
      ),
    );
  }
}
