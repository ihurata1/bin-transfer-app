// ignore_for_file: prefer_const_constructors

import 'package:boilerplate/components/app_bottom_nav_bar_item.dart';
import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/screens/home/home.dart';
import 'package:flutter/material.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      bottomNavBarItemList: [
        AppBottomNavBarItem(value: "Addresses", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
        AppBottomNavBarItem(value: "Addresses", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
        AppBottomNavBarItem(value: "Addresses", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))),
      ],
      child: Column(
        children: [],
      ),
    );
  }
}
