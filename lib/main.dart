import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';

// background message
Future<void> firebaseBackgroundHandler(RemoteMessage remoteMessage) async {
  await Firebase.initializeApp();
  debugPrint('1. bg message id ${remoteMessage.messageId}');
}

void main() async {
  // Init Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Init Firebase Messaging
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // Init Firebase Messaging Notification Setting
  NotificationSettings notificationSettings =
      await firebaseMessaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
  debugPrint('2. init notif ${notificationSettings.authorizationStatus}');
  // call on background
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  // on foreground notif
  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    debugPrint('3. remote message data ${remoteMessage.data}');
    if (remoteMessage.notification != null) {
      debugPrint(
          '4. remote message notification ${remoteMessage.notification}');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        color: Colors.amber,
        child: const Center(child: Text('halo')),
      ),
    );
  }
}
