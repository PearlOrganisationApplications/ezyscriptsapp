import 'package:ezyscripts/constant/colors.dart';
import 'package:get/get.dart';

import 'internet_controller.dart';



class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}