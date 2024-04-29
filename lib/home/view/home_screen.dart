import 'package:flutter/foundation.dart';
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
  final PushNotificationController pushNotificationController =
  Get.put(PushNotificationController());
  void initState() {
    pushNotificationController.requestNotificationPermission();
    pushNotificationController.forgroundMessage();
    pushNotificationController.firebaseInit(context);
    pushNotificationController.setupInteractMessage(context);
    pushNotificationController.isTokenRefresh();

    pushNotificationController.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("token : ${pushNotificationController.deviceToken.value}");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Column(children: [
          Obx(() => Text("${pushNotificationController.deviceToken.value}"))
        ],),
      ),
    );
  }
}
