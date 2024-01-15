// ignore_for_file: prefer_const_constructors

import 'package:boilerplate/constants/app.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:flutter/material.dart';

import '../../components/app_container/app_container.dart';

class BinListScreen extends StatefulWidget {
  const BinListScreen({super.key});

  @override
  State<BinListScreen> createState() => _BinListScreenState();
}

class _BinListScreenState extends State<BinListScreen> {
  String binLocationDetailValue = "";
  Widget _binActions(title, isMoveBin) {
    return GestureDetector(
      onTap: () => moveBinPopUp(title, isMoveBin),
      child: Container(
        color: Color(0xff17579a),
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  moveBinPopUp(title, isMoveBin) {
    showDialog(
      context: Application.context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: DeviceInfo.height(4)),
                  width: DeviceInfo.width(84),
                  child: !isMoveBin
                      ? Text(
                          "$title\nRequest is received !",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Where would you want to move your bin ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24),
                            ),
                            DropdownButton<String>(
                              value: binLocationDetailValue.isNotEmpty ? binLocationDetailValue : null,
                              underline: Container(),
                              items: <String>['Address 1', 'Address 2', 'Address 3'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (v) {
                                v != null ? setState(() => binLocationDetailValue = v) : null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Location Detail',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => isMoveBin = false),
                              child: Container(
                                color: AppColor.blue,
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Move Bin",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  Widget binCard(String binNumber, String distance) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: DeviceInfo.height(1)),
        width: double.infinity,
        height: DeviceInfo.height(8),
        color: Color(0xffd9d9d9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: DeviceInfo.width(2)), child: Text("Bin number: $binNumber")),
            Padding(padding: EdgeInsets.only(left: DeviceInfo.width(2)), child: Text("Size: $distance yard")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: DeviceInfo.width(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _binActions("Swipe Bin", false),
                  _binActions("Move Bin", true),
                  _binActions("Pick Up Bin", false),
                ],
              ),
            ),
          ],
        ), // Text'i ortalar
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
                  Text("Company A", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  Text("30 Bedford", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  SizedBox(height: DeviceInfo.height(2)),
                  Container(width: double.infinity, height: DeviceInfo.height(0.2), color: Colors.white),
                  SizedBox(height: DeviceInfo.height(2)),
                  Container(
                    color: Color(0xff17579a),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Order New Bin",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: DeviceInfo.height(4)),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bin List',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: DeviceInfo.height(2)),
                    binCard('30-001', "30"),
                    binCard('30-001', "30"),
                    binCard('30-001', "30"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
