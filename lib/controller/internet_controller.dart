import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:ezyscripts/screens/profile/profile_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/splash_screen.dart';

var screens;


class NetworkController extends GetxController{
  final Connectivity _connectivity=Connectivity();
  Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;
  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivity.onConnectivityChanged.listen(UpdateConnectionStatus);
  }

  void initConnectivity() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    connectionStatus.value = result;
    UpdateConnectionStatus(result);
  }

  void UpdateConnectionStatus(ConnectivityResult connectivityResult){
    if(connectivityResult == ConnectivityResult.none){
      Get.off(AlertDialog(
        actions: [],
        content: Text('No Internet Connection found'),
      ));
    } else if(token!=null) {
      Get.offAll(HomeScreen()); // Navigate to the HomeScreen and remove all previous routes
    }
    else{
      Get.offAll(SplashScreen());
    }
  }
}

class NoInternetScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/no_connection.jpg',
            width: double.infinity,
            height: double.infinity,),
          //child: Text(" No internet connect found ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,),))
        ),
      ),
    );
  }
}
