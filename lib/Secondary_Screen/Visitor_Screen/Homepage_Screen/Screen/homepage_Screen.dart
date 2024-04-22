import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/screens/history_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Homepage_Screen/Widgets/containerDecoration.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/State/Controller/visitor_list_Controller.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/State/Service/visitor_list.dart';
import 'package:pass/routes.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late UserController userController;
  late String userId;

  late VisitorListController visitorListController;
  late String visitorId;

  @override
  void initState() {
    super.initState();
    userController = Get.find();
    userId = userController.userId.value;
    visitorListController = Get.find();
    visitorId = visitorListController.visitorId.value;
    print(visitorId);
  }

  final VisitorListController visitorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.scanScreen);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: homepageBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Image.asset(AppImages.qrIcon),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SCAN NOW",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManualScreen(),
                    ));
              },
              child: Container(
                height: 100,
                width: 200,
                decoration: homepageBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Image.asset(AppImages.mannualimg),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Manual Entry",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: homepageSecBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: ListTile(
              title: Text(
                "Total Visits",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "$userId",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              trailing: Image.asset(AppImages.vector1),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: homepageBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: ListTile(
              title: Text(
                "Total Visits",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "367K",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              trailing: Image.asset(AppImages.vector1),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: homepageSecBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: ListTile(
              title: Text(
                "Total Visits",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "367K",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              trailing: Image.asset(AppImages.vector1),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        HistoryBody(),
        // Text(
        //   "Recent Visit",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 10),
        //   child: DataTable(
        //     columns: [
        //       DataColumn(
        //           label: Text('Organization',
        //               style: TextStyle(
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black87))),
        //       DataColumn(
        //           label: Text('Date',
        //               style: TextStyle(
        //                   fontSize: 14, fontWeight: FontWeight.bold))),
        //       DataColumn(
        //           label: Text('Branch',
        //               style: TextStyle(
        //                   fontSize: 14, fontWeight: FontWeight.bold))),
        //     ],
        //     rows: [
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        //
        //
        // Padding(
        //   padding: const EdgeInsets.only(right: 10),
        //   child: DataTable(
        //     columns: [
        //       DataColumn(
        //           label: Text('Organization',
        //               style: TextStyle(
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black87))),
        //       DataColumn(
        //           label: Text('Date',
        //               style: TextStyle(
        //                   fontSize: 14, fontWeight: FontWeight.bold))),
        //       DataColumn(
        //           label: Text('Branch',
        //               style: TextStyle(
        //                   fontSize: 14, fontWeight: FontWeight.bold))),
        //     ],
        //     rows: [
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('Pointzero')),
        //         DataCell(Text('2030-21-01')),
        //         DataCell(Text('KTM')),
        //       ]),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
