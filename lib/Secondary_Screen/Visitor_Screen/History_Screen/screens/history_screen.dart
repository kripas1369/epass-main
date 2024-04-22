import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/screens/history_detail_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/components/history_list_tile.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/serivce/service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';

import '../models/orghistory.dart';

class HistoryBody extends StatefulWidget {
  const HistoryBody({super.key});

  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

// ... (your existing imports and code)

class _HistoryBodyState extends State<HistoryBody> {
  final HistoryService historyService =
      HistoryService(); // Initialize the service

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Showing transaction of last 30 days",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.white12,
            width: double.infinity,
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
                  print(historyData);

                  if (historyData.results == null ||
                      historyData.results!.isEmpty) {
                    // Display "There is no data" message
                    return Center(child: Text('There is no data'));
                  }

                  return ListView.builder(
                      itemCount: historyData.results?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        List<Results> result = historyData.results!;
                        return HistoryListTile(
                          organization: result[index].organizationName!,
                          address: result[index].visitingFrom!,
                          date: result[index].visitedAt!,
                          index: index,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryDetailScreen(
                                      // details: result,
                                      // index: index,
                                      ),
                                ));
                          },
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Card(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 0, left: 0),
//                         child: DataTable(
//                           columns: [
//                             DataColumn(
//                               label: Text(
//                                 'Organization',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Date',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Branch',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                           rows: historyData.results?.map((result) {
//                                 return DataRow(cells: [
//                                   DataCell(
//                                     Text(
//                                       result.organizationName?.substring(
//                                               0,
//                                               min(
//                                                   10,
//                                                   result.organizationName!
//                                                       .length)) ??
//                                           '',
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 1,
//                                     ),
//                                   ),
//                                   DataCell(
//                                     Text(
//                                       (result.visitedAt ?? '').substring(
//                                           0,
//                                           min(10,
//                                               (result.visitedAt ?? '').length)),
//                                     ),
//                                   ),
//                                   DataCell(
//                                     Text(
//                                       result.visitingFrom?.substring(
//                                               0,
//                                               min(
//                                                   10,
//                                                   result
//                                                       .visitingFrom!.length)) ??
//                                           '',
//                                       maxLines: 1,
//                                     ),
//                                   ),
//                                 ]);
//                               }).toList() ??
//                               [],
//                         ),
//                       ),
//                     );
