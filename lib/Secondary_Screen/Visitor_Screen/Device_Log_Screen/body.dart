import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Device_Log_Screen/Screen/details_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Exception/success_msg_widget.dart';

class Device {
  final int id;
  final String name;
  final String type;
  final String ipAddress;
  final String createdAt;
  final String updatedAt;

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.ipAddress,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name_of_device'],
      type: json['device_type'],
      ipAddress: json['ip_address'],
      createdAt: json['create_at'],
      updatedAt: json['update_at'],
    );
  }
}

class DeviceListScreen extends StatefulWidget {
  @override
  _DeviceListScreenState createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  List<Device> devices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDevices();

  }

  Future<void> fetchDevices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("access_token") ?? "";

    final url = "${ApiUrl.baseurl}/organization/devices/";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );

      if (response.statusCode == 200) {
        print("${response.body}^^^^^^^^^^^^^^^^^");
        List<dynamic> jsonResponse = json.decode(response.body);
        setState(() {
          devices = jsonResponse.map((json) => Device.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        // Handle errors
        print("Failed to load devices: ${response.statusCode}");
        isLoading = false;
      }
    } catch (e) {
      // Handle exceptions
      print("Exception while loading devices: $e");
      isLoading = false;
    }
  }

  void _deleteDevice(BuildContext context, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("access_token") ?? "";

    final url = "${ApiUrl.baseurl}/organization/devices/";

    final requestBody = jsonEncode({
      "id": id,
    });
    print(id);
    print(id);
    print(id);
    print(id);
    print(id);
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        // Device deleted successfully
        showSnackBar("Device deleted successfully", Colors.green);

        print("Device deleted successfully");
        // Reload devices after deletion
        fetchDevices();
      } else {
        // Handle errors
        print("Failed to delete device:");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to delete device. Please try again."),
          ),
        );
      }
    } catch (e) {
      // Handle exceptions
      print("Exception while deleting device: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred while deleting the device."),
        ),
      );
    }
  }

  void _showDeleteDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Item"),
          content: Text("Are you sure you want to delete this item?"),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            MaterialButton(
              onPressed: () {
                _deleteDevice(context, id); // Call the delete function
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppImages.backIcon),
        ),
        title: Text(
          'Device Log',
          style: TextStyle(
            color: Color(0xFF090A0A),
            fontSize: 17,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeviceLogDetailsPage(
                      devicename: devices[index].name,
                      location: devices[index].type,
                      date: devices[index].createdAt,
                    ),
                  ),
                );
              },
              trailing: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  _showDeleteDialog(context, devices[index].id);
                },
              ),
              title: Text(devices[index].name),
              subtitle: Text(devices[index].type),
              leading: Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: Color(0xFFE5F3FE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
