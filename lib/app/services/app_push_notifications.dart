import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AppPushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String tokenDevice = "";

  static Future initializeApp() async {
    await Firebase.initializeApp();
    tokenDevice = await messaging.getToken() ?? "No found token";

    print("Token Device: " + tokenDevice);
    //Llamar rutina de insert a BD

    //Cuando este abierto
    //Cuando este cerrado
    //Cuando este finalizado
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedAppHandler);
  }

  static Future _onBackgroundHandler(RemoteMessage message) async {
    print("_onBackgroundHandler: ${message.data}");
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print("_onMessageHandler: ${message.data}");
  }

  static Future _onMessageOpenedAppHandler(RemoteMessage message) async {
    print("_onMessageOpenedAppHandler: ${message.data}");
  }
}
