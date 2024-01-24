// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:boilerplate/components/app_bottom_nav_bar_item.dart';
import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:boilerplate/screens/home/home.dart';
import 'package:flutter/material.dart';

class ManagerRequestListScreen extends StatefulWidget {
  const ManagerRequestListScreen({super.key});

  @override
  State<ManagerRequestListScreen> createState() => _ManagerRequestListScreenState();
}

class _ManagerRequestListScreenState extends State<ManagerRequestListScreen> {
  Widget requestCard(String address) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: DeviceInfo.height(1)),
        width: double.infinity,
        height: DeviceInfo.height(30),
        color: Color(0xffd9d9d9),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: DeviceInfo.width(2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Company: Company A"),
                    Text("Company: Company A"),
                    Text("Requested Date: January 15 2023,  08:30"),
                    Text("Bin Number: 30-001"),
                    Text("Size: 30 yard"),
                    Text("Address: 30 Bedford"),
                    Text("Status:  Pending"),
                    Text("Request:  Swipe"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: DeviceInfo.height(1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: DeviceInfo.width(2), bottom: DeviceInfo.width(2)),
                    width: DeviceInfo.width(30),
                    height: DeviceInfo.height(5),
                    color: AppColor.blue,
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: DeviceInfo.width(2), bottom: DeviceInfo.width(2)),
                    width: DeviceInfo.width(30),
                    height: DeviceInfo.height(5),
                    color: AppColor.red,
                    child: Center(
                      child: Text(
                        "Decline",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ), // Text'i ortalar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      bottomNavBarItemList: [
        AppBottomNavBarItem(value: "Addresses", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
        AppBottomNavBarItem(value: "Addresses", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
        AppBottomNavBarItem(value: "Addresses", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
      ],
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
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Incoming Requests",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
