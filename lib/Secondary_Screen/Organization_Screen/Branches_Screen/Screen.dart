import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Branch_Detail_Screen/service/branch_service.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Branches_Screen/model/branches_model.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Branches_Screen/service/branch_list_services.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'package:pass/routes.dart';

class BranchScreen extends StatefulWidget {
  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // const VisitorScreen({Key? key}) : super(key: key);
  List<BranchList> branchlist = [];

  void getallbranches() async {
    branchlist = await BranchListService().getallbranches();
    setState(() {});
  }

  @override
  void initState() {
    getallbranches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      // drawer:MyDrawer(),

      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Branches",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.orgbranchdetailsScreen);
                    },
                    child: Text(
                      "+ADD NEW BRANCH",
                      style: TextStyle(color: primaryColor, fontSize: 16),
                    ))
              ],
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
                  rows: branchlist.map((e) {
                    return DataRow(cells: [
                      DataCell(Text(e.name)),
                      DataCell(Text("2030-21-20")),
                      DataCell(Text(e.district)),
                    ]);
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
