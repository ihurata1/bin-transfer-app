import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:flutter/material.dart';

class AppBottomNavBarItem extends StatefulWidget {
  AppBottomNavBarItem({super.key, required this.value, required this.onTap});
  final String value;
  final VoidCallback onTap;

  @override
  State<AppBottomNavBarItem> createState() => _AppBottomNavBarItemState();
}

class _AppBottomNavBarItemState extends State<AppBottomNavBarItem> {
  bottomNavBarItem(String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: DeviceInfo.width(24),
        height: DeviceInfo.height(5),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return bottomNavBarItem(widget.value, widget.onTap);
  }
}
