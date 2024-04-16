import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/notification_controller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificationController notificationController =
  Get.put(NotificationController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationController.requestNotificationPermission();
    notificationController.firebaseInit();
    notificationController.getDeviceToken().then((value) {
      print("Token: $value");
    });
    notificationController.isTokenRefresh();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [],),
      ),
    );
  }
}
