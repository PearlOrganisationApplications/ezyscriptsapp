import 'dart:async';

import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/screens/profile/profile_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ezyscripts/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

late Size screenSize;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isDeviceConnected = false;

  @override
  void initState() {
    ApiService.getProfileDetails();
    getToken();
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      updateConnectionStatus(result);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    if (result != ConnectivityResult.wifi) {
      setState(() async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected) {
          print('Not connected');
          showDialogBox();
        }
      });
    } else {
      setState(() {
        isDeviceConnected = false;
        showDialogBox();
      });
    }
  }

  void showDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'No Connection',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        content: const Text('Please check your internet connectivity'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
