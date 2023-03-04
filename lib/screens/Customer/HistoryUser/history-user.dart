import 'package:barber/screens/Customer/HistoryUser/row-history.dart';
import 'package:barber/screens/Customer/Home/home-user-controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class HistoryUser extends StatelessWidget {
  HistoryUser({Key? key}) : super(key: key);

  final columnData = [
    {
      "name": 'No',
    },
    {
      "name": 'Name',
    },
    {
      "name": 'Hair',
    },
    {
      "name": 'Date',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final homeUserController = Get.find<HomeUserController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(builder: (context, ctr) {
        return Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    homeUserController.pageSwapHistory.animateTo(
                      0,
                      duration: 300.milliseconds,
                      curve: Curves.decelerate,
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Gap(25),
                Text(
                  'ประวัติการจองย้อนหลัง',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Gap(20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Table(
                    // defaultColumnWidth: FixedColumnWidth(120.0),
                    columnWidths: {
                      0: FixedColumnWidth(ctr.maxWidth * 0.10),
                      1: FixedColumnWidth(ctr.maxWidth * 0.28),
                      2: FixedColumnWidth(ctr.maxWidth * 0.28),
                      3: FixedColumnWidth(ctr.maxWidth * 0.34),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        children: [
                          ...columnData.mapIndexed((i, e) {
                            return Container(
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
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color:e['name'] == 'Date' ? null : Colors.black,
                                    width: 2,
                                  ),
                                ],
                              ),
                            );
                          }).toList()
                        ],
                      ),
                        ...homeUserController.historyData.map((e) {
                          return RowHistory(e: e).getRowHistory();
                        }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
