import 'package:flutter/material.dart';

class RowHistory extends Table {
  late final e;
  RowHistory({required this.e});

  TableRow getRowHistory() {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
      ),
      children: [
        Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    '${e['no']}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                width: 2,
              ),
            ],
          ),
        ),
        Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    '${e['userData']['fullName']}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                width: 2,
              ),
            ],
          ),
        ),
        Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    '${e['name']}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                width: 2,
              ),
            ],
          ),
        ),
        Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    '${e['booking_time']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                color: null,
                width: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
