// ignore_for_file: prefer_const_constructors

import 'package:boilerplate/components/app_bottom_nav_bar_item.dart';
import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:boilerplate/models/location.dart';
import 'package:boilerplate/screens/home/home.dart';
import 'package:boilerplate/screens/user/bin_list.dart';
import 'package:boilerplate/services/location_list.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String companyNameValue = "";

  Widget addressCard(String location) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BinListScreen(location: location))),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: DeviceInfo.height(1)),
        width: double.infinity,
        height: DeviceInfo.height(8),
        color: Color(0xffd9d9d9),
        child: Center(child: Text(location)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      bottomNavBarItemList: [
        AppBottomNavBarItem(value: "Home", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
        AppBottomNavBarItem(value: "Locations", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
        AppBottomNavBarItem(value: "Bins", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
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
                    color: Color(0xff17579a),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Add New Address",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Address List',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: DeviceInfo.height(2)),
            FutureBuilder<List<LocationModel?>>(
              future: LocationListService().getLocationList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => addressCard(snapshot.data![index]!.location!),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
