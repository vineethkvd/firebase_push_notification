import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> firebaseInit() async {
    // Initialize Firebase messaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages
      if (kDebugMode) {
        print("Foreground message received: ${message.notification?.body}");
        print("Foreground message received: ${message.notification?.title}");
      }
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle background messages
      if (kDebugMode) {
        print("Foreground message received: ${message.notification?.body}");
        print("Foreground message received: ${message.notification?.title}");
      }
    });
  }

  Future<void> localNotificationInit() async {
// Initialize local notifications
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }
  Future<void> showNotification(RemoteMessage message) async {

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id', // This is the ID of the channel.
      'your_channel_name', // This is the name of the channel.
      'your_channel_description', // This is the description of the channel.
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    // Show the notification
    await _flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      message.notification?.title, // Notification title
      message.notification?.body, // Notification body
      platformChannelSpecifics, // Notification details
      payload: 'item x', // Custom data to pass
    );

  }

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Permission granted");
    } else {
      print("Permission denied or not determined");
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  Future<void> isTokenRefresh() async {
    messaging.onTokenRefresh.listen((String? newToken) {
      print("Token refreshed: $newToken");
    });
  }
}
