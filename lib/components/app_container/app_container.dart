import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:boilerplate/screens/home/home.dart';
import 'package:boilerplate/screens/manager/manager_adress_list.dart';
import 'package:boilerplate/screens/user/bin_request_list.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  bottomNavBarItem(String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: DeviceInfo.width(24),
        height: DeviceInfo.height(5),
        color: AppColor.blue,
        child: Center(
          child: Text(
            value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Dump Waste Management"),
        centerTitle: true,
        backgroundColor: AppColor.gray,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.black,
      body: SafeArea(
        /*top: false,
        bottom: false,*/
        child: Container(
          alignment: Alignment.center,
          child: child,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: DeviceInfo.height(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            bottomNavBarItem("Home", () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
            bottomNavBarItem("My Requests", () => Navigator.push(context, MaterialPageRoute(builder: (context) => BinRequestListScreen()))),
            bottomNavBarItem("Manager", () => Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerAdressListScreen()))),
          ],
        ),
      ),
    );
  }
}
