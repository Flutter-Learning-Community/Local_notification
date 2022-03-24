import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       accentColor: Colors.red,
        primarySwatch: Colors.blue,
      ),
      home:Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late FlutterLocalNotificationsPlugin fltrNotification;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
var androidInitilize = new AndroidInitializationSettings('appicon');
var iosinitilize = new IOSInitializationSettings();
var initilizationSettings = new InitializationSettings(android: androidInitilize,iOS: iosinitilize);
fltrNotification =new FlutterLocalNotificationsPlugin();
fltrNotification.initialize(initilizationSettings,onSelectNotification: notificationSelected);
  }

_showNotification() async{
  var androidDetails = new AndroidNotificationDetails(' Name', 'Notification',importance: Importance.max);
  var IOSDetails = new IOSNotificationDetails();
  var generalNotificationDetails = new NotificationDetails(android: androidDetails,iOS: IOSDetails );

await fltrNotification.show(0, 'Notifi', 'notification 1', generalNotificationDetails);

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: RaisedButton(onPressed: _showNotification,
      child: Text('Notification'),)),
    );
  }
  Future notificationSelected(String) async{

  }
}