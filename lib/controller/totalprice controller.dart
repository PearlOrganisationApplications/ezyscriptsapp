import 'package:ezyscripts/constant/colors.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  final count = 1.obs;
  final price=(int.tryParse(myResponse!.scriptDetails[0].productPrice.substring(1,)) ?? 0).obs;
  void increment() {
    count.value++;
  }
  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }
  int quantity = 1;
  int manualPrice = 30;
  RxInt total = 0.obs;

  void addPrices() {
    // Ensure myResponse and myResponse.scriptDetails are not null before accessing them
    if (myResponse != null && myResponse!.scriptDetails != null) {
      int totalPrice = 0;
      for (var item in myResponse!.scriptDetails!) {
        int productPrice = int.tryParse(item.productPrice.substring(1)) ?? 0;
        print("API Product Price: $productPrice");
        print("Manual Price: $manualPrice");
        totalPrice += (productPrice * quantity); // Accumulate total price
      }
      total.value = totalPrice + manualPrice; // Update total price
      print("Total Price: ${total.value}");
    } else {

    }
  }
  void incrementQuantityAndCalculatePrice() {
    quantity++;
    update();// Increment quantity
    addPrices(); // Recalculate total price based on updated quantity
  }

  void decrementQuantityAndCalculatePrice() {
    if (quantity > 1) {
      quantity--;
     // Decrement quantity if greater than 1
      addPrices(); // Recalculate total price based on updated quantity
    }

  }
  void subtotalPrice() {
    price.value = price.value * count.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
class MedicalController extends GetxController {
  final count = 1.obs;
  final price=(int.tryParse(myResponse!.certificateDetails[0].price.substring(1,)) ?? 0).obs;
  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }
  int quantity = 1;
  int manualPrice = 30;
  RxInt total = 0.obs;

  void addPrices() {
    // Ensure myResponse and myResponse.scriptDetails are not null before accessing them
    if (myResponse != null && myResponse!.certificateDetails != null) {
      int totalPrice = 0;
      for (var item in myResponse!.certificateDetails!) {
        int productPrice = int.tryParse(item.price.substring(1)) ?? 0;
        print("API Product Price: $productPrice");
        print("Manual Price: $manualPrice");
        totalPrice += (productPrice * quantity); // Accumulate total price
      }
      total.value = totalPrice + manualPrice; // Update total price
      print("Total Price: ${total.value}");
    } else {
      print("myResponse or myResponse.scriptDetails is null");
    }
  }
  void incrementQuantityAndCalculatePrice() {
    quantity++;
    update();// Increment quantity
    addPrices(); // Recalculate total price based on updated quantity
  }

  void decrementQuantityAndCalculatePrice() {
    if (quantity > 1) {
      quantity--;
     // Decrement quantity if greater than 1
      addPrices(); // Recalculate total price based on updated quantity
    }

  }
  void subtotalPrice() {
    price.value = price.value * count.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
class ConsulationController extends GetxController {
  final count = 1.obs;
  final price=(int.tryParse(myResponse!.scriptDetails[0].productPrice.substring(1,)) ?? 0).obs;
  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }
  int quantity = 1;
  int manualPrice = 30;
  RxInt total = 0.obs;

  void addPrices() {
    // Ensure myResponse and myResponse.scriptDetails are not null before accessing them
    if (myResponse != null && myResponse!.consultationDetail != null) {
      int totalPrice = 0;
      for (var item in myResponse!.consultationDetail!) {
        int productPrice = int.tryParse(item.price.substring(1)) ?? 0;
        print("API Product Price: $productPrice");
        print("Manual Price: $manualPrice");
        totalPrice += (productPrice * quantity); // Accumulate total price
      }
      total.value = totalPrice + manualPrice; // Update total price
      print("Total Price: ${total.value}");
    } else {
      print("myResponse or myResponse.scriptDetails is null");
    }
  }
  void incrementQuantityAndCalculatePrice() {
    quantity++;
    update();// Increment quantity
    addPrices(); // Recalculate total price based on updated quantity
  }

  void decrementQuantityAndCalculatePrice() {
    if (quantity > 1) {
      quantity--;
     // Decrement quantity if greater than 1
      addPrices(); // Recalculate total price based on updated quantity
    }

  }
  void subtotalPrice() {
    price.value = price.value * count.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
class SpecialistController extends GetxController {
  final count = 1.obs;
  final price=(int.tryParse(myResponse!.scriptDetails[0].productPrice.substring(1,)) ?? 0).obs;
  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }
  int quantity = 1;
  int manualPrice = 30;
  RxInt total = 0.obs;

  void addPrices() {
    // Ensure myResponse and myResponse.scriptDetails are not null before accessing them
    if (myResponse != null && myResponse!.scriptDetails != null) {
      int totalPrice = 0;
      for (var item in myResponse!.scriptDetails!) {
        int productPrice = int.tryParse(item.productPrice.substring(1)) ?? 0;
        print("API Product Price: $productPrice");
        print("Manual Price: $manualPrice");
        totalPrice += (productPrice * quantity); // Accumulate total price
      }
      total.value = totalPrice + manualPrice; // Update total price
      print("Total Price: ${total.value}");
    } else {
      print("myResponse or myResponse.scriptDetails is null");
    }
  }
  void incrementQuantityAndCalculatePrice() {
    quantity++;
    update();// Increment quantity
    addPrices(); // Recalculate total price based on updated quantity
  }

  void decrementQuantityAndCalculatePrice() {
    if (quantity > 1) {
      quantity--;
     // Decrement quantity if greater than 1
      addPrices(); // Recalculate total price based on updated quantity
    }

  }
  void subtotalPrice() {
    price.value = price.value * count.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
class BloodController extends GetxController {
  final count = 1.obs;
  final price=(int.tryParse(myResponse!.scriptDetails[0].productPrice.substring(1,)) ?? 0).obs;
  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }
  int quantity = 1;
  int manualPrice = 30;
  RxInt total = 0.obs;

  void addPrices() {
    // Ensure myResponse and myResponse.scriptDetails are not null before accessing them
    if (myResponse != null && myResponse!.scriptDetails != null) {
      int totalPrice = 0;
      for (var item in myResponse!.scriptDetails!) {
        int productPrice = int.tryParse(item.productPrice.substring(1)) ?? 0;
        print("API Product Price: $productPrice");
        print("Manual Price: $manualPrice");
        totalPrice += (productPrice * quantity); // Accumulate total price
      }
      total.value = totalPrice + manualPrice; // Update total price
      print("Total Price: ${total.value}");
    } else {
      print("myResponse or myResponse.scriptDetails is null");
    }
  }
  void incrementQuantityAndCalculatePrice() {
    quantity++;
    update();// Increment quantity
    addPrices(); // Recalculate total price based on updated quantity
  }

  void decrementQuantityAndCalculatePrice() {
    if (quantity > 1) {
      quantity--;
     // Decrement quantity if greater than 1
      addPrices(); // Recalculate total price based on updated quantity
    }

  }
  void subtotalPrice() {
    price.value = price.value * count.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
