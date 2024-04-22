import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Homepage_Screen/Widgets/containerDecoration.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Homepage_Screen/model/visit_history_model.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Homepage_Screen/service/home_service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Homepage_Screen/Widgets/containerDecoration.dart';
import 'package:pass/routes.dart';

class OrgHomeBody extends StatefulWidget {
  const OrgHomeBody({Key? key}) : super(key: key);

  @override
  State<OrgHomeBody> createState() => _OrgHomeBodyState();
}

class _OrgHomeBodyState extends State<OrgHomeBody> {
  Map<String, dynamic>? orgdata;
  List<VisitHistoryModel> visits = [];
  Future getorgdata() async {
    orgdata = await TokenStorage().getOrgdata();
    print("****************************");
    print(orgdata);
    print("****************************");
    visits = await HomeService().getallvisisthistory();
    setState(() {});
  }

  @override
  void initState() {
    getorgdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return visits.isEmpty
        ? Center()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: orghomepageBoxDecoration(),
                child: Row(
                  children: [
                    Spacer(),
                    Image.asset(AppImages.homeqrimage),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${orgdata!["full_name"]}, Organization \n Private Limited",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Boudha,ktm Nepal",
                          style: TextStyle(
                            color: Color.fromRGBO(76, 110, 212, 1),
                          ),
                        ),
                        MaterialButton(
                          color: Color.fromRGBO(76, 110, 212, 1),
                          onPressed: () {
                            TokenStorage().getOrgdata();
                          },
                          child: Text(
                            "Manual Entry",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.orgwaitingvisitorsScreen);
                },
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: orghomepageSecBoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: ListTile(
                      title: Text(
                        "Waiting Visits",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "10",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      // trailing: Image.asset(AppImages.vector1),
                    ),
                    // ),
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
                      "Total Visitors",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "1,156",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    // trailing: Image.asset(AppImages.vector1),
                  ),
                  // ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: orghomepageSecBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: ListTile(
                    title: Text(
                      "Total Visits",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "342K",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    trailing: Image.asset(AppImages.vector1),
                  ),
                  // ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Recent Visit",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Organization',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Branch',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Pointzero')),
                      DataCell(Text('2030-21-01')),
                      DataCell(Text('KTM')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Pointzero')),
                      DataCell(Text('2030-21-01')),
                      DataCell(Text('KTM')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Pointzero')),
                      DataCell(Text('2030-21-01')),
                      DataCell(Text('KTM')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Pointzero')),
                      DataCell(Text('2030-21-01')),
                      DataCell(Text('KTM')),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text('Organization',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87))),
                      DataColumn(
                          label: Text('Date',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Branch',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                    ],
                    rows: visits.map((e) {
                      DateTime utcDateTime =
                          DateTime.parse(e.departedAt.toString());
                      DateTime localDateTime = utcDateTime.toLocal();

                      String formattedDateTime =
                          DateFormat.yMd().format(localDateTime);
                      // final date=
                      print(e.departedAt);
                      return DataRow(cells: [
                        DataCell(Text(e.fullName)),
                        DataCell(Text(formattedDateTime)),
                        DataCell(Text(e.visitingFrom)),
                      ]);
                    }).toList()
                    //  [

                    //   DataRow(cells: [

                    //     DataCell(Text('Pointzero')),
                    //     DataCell(Text('2030-21-01')),
                    //     DataCell(Text('KTM')),
                    //   ]),
                    //   DataRow(cells: [
                    //     DataCell(Text('Pointzero')),
                    //     DataCell(Text('2030-21-01')),
                    //     DataCell(Text('KTM')),
                    //   ]),
                    //   DataRow(cells: [
                    //     DataCell(Text('Pointzero')),
                    //     DataCell(Text('2030-21-01')),
                    //     DataCell(Text('KTM')),
                    //   ]),
                    //   DataRow(cells: [
                    //     DataCell(Text('Pointzero')),
                    //     DataCell(Text('2030-21-01')),
                    //     DataCell(Text('KTM')),
                    //   ]),
                    // ],
                    ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          );
  }
}
