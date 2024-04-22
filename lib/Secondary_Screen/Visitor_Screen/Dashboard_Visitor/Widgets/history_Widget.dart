import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/models/orghistory.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/serivce/service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';

class DashHistoryContainer extends StatefulWidget {
  const DashHistoryContainer({super.key});

  @override
  State<DashHistoryContainer> createState() => _DashHistoryContainerState();
}

class _DashHistoryContainerState extends State<DashHistoryContainer> {
  final HistoryService historyService =
      HistoryService(); // Initialize the service

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "History Summary",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white12,
          width: 400,
          child: FutureBuilder(
            future: historyService.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                orghistory historyData =
                    orghistory.fromJson(snapshot.data ?? {});
                if (historyData.results == null ||
                    historyData.results!.isEmpty) {
                  // Display "There is no data" message
                  return Center(child: Text(''));
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: Card(
                    child: DataTable(
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
                            'Date',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Branch',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      rows: historyData.results?.map((result) {
                            return DataRow(cells: [
                              DataCell(
                                Text(
                                  result.organizationName?.substring(
                                          0,
                                          min(
                                              10,
                                              result
                                                  .organizationName!.length)) ??
                                      '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              DataCell(
                                Text(
                                  (result.visitedAt ?? '').substring(0,
                                      min(10, (result.visitedAt ?? '').length)),
                                ),
                              ),
                              DataCell(
                                Text(
                                  result.visitingFrom?.substring(
                                          0,
                                          min(10,
                                              result.visitingFrom!.length)) ??
                                      '',
                                  maxLines: 1,
                                ),
                              ),
                            ]);
                          }).toList() ??
                          [],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
