import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/splash_screen.dart';

/*class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {

    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text(
              'PLEASE CONNECT TO THE INTERNET',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
              )
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}*/


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
        )
      ),
    );
  }
}