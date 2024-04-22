import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'package:pass/routes.dart';

import '../State/Service/visitor_list.dart';

class VisitorBranchScreen extends StatefulWidget {
  @override
  _VisitorBranchScreenState createState() => _VisitorBranchScreenState();
}

class _VisitorBranchScreenState extends State<VisitorBranchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> branchList = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch data when the widget is initialized
    fetchData();
  }


  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl.branchlist));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("!!!!!!!!!!!!");
        print("!!!!!!!!!!!!");
        print("!!!!!!!!!!!!");
        print("!!!!!!!!!!!!");
        print('Response body: ${response.body}');
        setState(() {
          branchList = List<Map<String, dynamic>>.from(data);
        });
      } else {
        // print('Failed to load data. Status code: ${response.statusCode}');

        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display a circular indicator while waiting for data
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    // Display an error message if there's an error
                    return Center(
                      child: Text('Error loading data'),
                    );
                  } else {
                    // Display the DataTable once the data is loaded
                    return DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            'Organization',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Country',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Id',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      rows: branchList.map(
                            (branch) => DataRow(cells: [
                          DataCell(Text(branch['name'].toString())),
                          DataCell(Text(branch['country'].toString())),
                          DataCell(Text(branch['id'].toString())),
                        ]),
                      ).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
