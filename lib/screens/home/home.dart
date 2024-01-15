// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_final_fields

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:boilerplate/screens/user/user.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _emailController = TextEditingController(text: "");
  TextEditingController _passwordController = TextEditingController(text: "");

  Widget inputField(controller, hint, isPassword) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DeviceInfo.width(4)),
      height: DeviceInfo.height(10),
      decoration: BoxDecoration(color: Color(0xffd9d9d9)),
      child: Center(
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            alignLabelWithHint: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Container(
        margin: EdgeInsets.only(top: DeviceInfo.height(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            inputField(_emailController, "Email", false),
            SizedBox(height: DeviceInfo.height(8)),
            inputField(_passwordController, "Password", false),
            SizedBox(height: DeviceInfo.height(8)),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              ),
              child: Container(
                height: DeviceInfo.height(6),
                width: DeviceInfo.width(50),
                decoration: BoxDecoration(color: AppColor.blue),
                child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
