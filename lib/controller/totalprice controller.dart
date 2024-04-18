import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestController extends ChangeNotifier {
  final totalPriceCalculate=TotalPriceCalculate();
  int totalPrice = 20;
 List <String>? actualPrice;
  int quantity = 1;
  List<int>inedx=[];

  calculatePrice() {
    for (var items in myResponse!.scriptDetails){
      actualPrice!.add(items.productPrice);
      print(actualPrice);
    }
    // totalPrice = quantity * (actualPrice ?? 0);
    allProductPrice=totalPrice;
    totalPriceCalculate.updateTotalPrice();
    totalQuantity.add(quantity);
    notifyListeners();
  }
  increment(){
    totalQuantity.add(quantity);
    quantity++;
    print(totalPrice);
    calculatePrice();
    notifyListeners();
  }
  decrement(){
    totalQuantity.remove(quantity);
    if(quantity>1){
      quantity--;
      calculatePrice();
      print(totalPrice);
      notifyListeners();
    }

  }
}


List<int>totalQuantity=[];

int allProductPrice=0;
class TotalPriceCalculate extends ChangeNotifier{
  int totalPriceOfTheProducts = 0;
  List<int> total = [];
  void updateTotalPrice()async {
    totalPriceOfTheProducts = allProductPrice;
    print(totalPriceOfTheProducts);
    print(total.length);
    total = List.from(totalQuantity);
    notifyListeners();
  }
}

Future<void> saveTotalProducts() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('totalProducts', myResponse!.bloodTestDetail.length+myResponse!.certificateDetails.length+
      myResponse!.consultationDetail.length+myResponse!.scriptDetails.length+myResponse!.referalsDetails.length);
}
Future<int?> getTotalProducts() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  totalProductQuantity=prefs.getInt('totalProducts')!;
  return totalProductQuantity;
}

int totalProductQuantity=0;

class  NumberProducts extends ChangeNotifier{
  void increment()async{

    totalProducts++;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('product', totalProducts);
    notifyListeners();
  }
  void decrementProduct()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('product', totalProducts);
    if(totalProducts>0){
      totalProducts--;
      notifyListeners();
    }

  }

  }
  Future<int>getTotalProduct()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    totalProducts=pref.getInt('product')!;
    print('TOTALPRODUCT${totalProducts}');
  return totalProducts;
  }