import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/text.dart';
import 'package:http/http.dart'as http;
class OrganizationDetails extends StatefulWidget {
  const OrganizationDetails({super.key,
    required this.orgId,

  });
  final String orgId;
  @override
  State<OrganizationDetails> createState() => _OrganizationDetailsState();
}

class _OrganizationDetailsState extends State<OrganizationDetails> {
  Future<List<Map<String, dynamic>>> fetchData() async {
    String apiUrl = '${ApiUrl.baseurl}/organization/${widget.orgId}';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      // Handle errors, e.g., throw an exception
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 200,
      width: 400,
      // color: Colors.red,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child:CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                // return ListTile(
                //   title: Text(user['full_name'] ?? 'No Name'),
                //   subtitle: Text(user['email'] ?? 'No Email'),
                //   // Add more widgets to display other user information
                // );
                return Card(
                  child:   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingText(
                          text: 'Organization Details',
                        ),
                        Row(
                          children: [
                            Text("Name:",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text(user['full_name'] ?? 'No Name'),                                  ],
                        ),Row(
                          children: [
                            Text("Type:",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text(user['email'] ?? 'No Email'),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Number:",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text(user['mobile_number'] ?? 'No Mobile Number'),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Email:",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text(user['email'] ?? 'No Mobile Number'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
