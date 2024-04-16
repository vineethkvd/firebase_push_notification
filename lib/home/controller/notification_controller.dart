import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> firebaseInit() async {
    // Initialize Firebase messaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages
      print("Foreground message received: ${message.notification?.body}");
      print("Foreground message received: ${message.notification?.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle background messages
      print("Background message opened: ${message.notification?.body}");
      print("Foreground message received: ${message.notification?.title}");
    });
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
