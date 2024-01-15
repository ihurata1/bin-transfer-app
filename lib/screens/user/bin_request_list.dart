// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:flutter/material.dart';

class BinRequestListScreen extends StatefulWidget {
  const BinRequestListScreen({super.key});

  @override
  State<BinRequestListScreen> createState() => _BinRequestListScreenState();
}

class _BinRequestListScreenState extends State<BinRequestListScreen> {
  String companyNameValue = "";

  Widget requestCard(String address) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: DeviceInfo.height(1)),
          width: double.infinity,
          height: DeviceInfo.height(12),
          color: Color(0xffd9d9d9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: DeviceInfo.width(2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bin Number: 30-001"),
                      Text("Size: 30 yard"),
                      Text("Address: 30 Bedford"),
                      Text("Status:  Pending"),
                      Text("Request:  Swipe"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: DeviceInfo.width(2), bottom: DeviceInfo.width(2)),
                  width: 75,
                  height: 50,
                  color: AppColor.red,
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ), // Text'i ortalar
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: DeviceInfo.width(4)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: DeviceInfo.height(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    child: DropdownButton<String>(
                      value: companyNameValue.isNotEmpty ? companyNameValue : null,
                      underline: SizedBox(), // Çizgiyi kaldırır
                      items: <String>['Company A', 'Company B', 'Company C', 'Company D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        value != null ? setState(() => companyNameValue = value) : null;
                      },
                    ),
                  ),
                  SizedBox(height: DeviceInfo.height(2)),
                  Container(width: double.infinity, height: DeviceInfo.height(0.2), color: Colors.white),
                  SizedBox(height: DeviceInfo.height(2)),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "My Requests",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: DeviceInfo.height(2)),
                  Container(width: double.infinity, height: DeviceInfo.height(0.2), color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: DeviceInfo.height(2)),
                  requestCard('30 Bedford'),
                  requestCard('10 Bedford'),
                  requestCard('3480 Dutch Village Rd'),
                  requestCard('16 Robbie St.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
