import 'package:ezyscripts/components/toast.dart';
import 'package:ezyscripts/controller/totalprice%20controller.dart';
import 'package:ezyscripts/screens/bloodtest/blood_test.dart';
import 'package:ezyscripts/screens/cart/cart_screen.dart';
import 'package:ezyscripts/screens/order/order_screen.dart';
import 'package:ezyscripts/screens/refil/step1/step1_screen.dart';
import 'package:ezyscripts/screens/specialist_referals/specialist_referals.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../about_us/about_us.dart';
import '../cart/empty_cart_screen.dart';
import '../contact_us/contact_us.dart';
import '../drawer/drawer.dart';
import '../medical_certificate/my_document.dart';
import '../profile/profile_api.dart';
import '../profile/profile_screen.dart';
import '../request_consultaion/request_consultaion.dart';
int totalProducts=0;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UserDetails> _userDetails;
  late Image image;
  final totalprice=TotalPriceCalculate();

  @override
  void initState() {
    super.initState();
    getToken();
    _userDetails = ApiService.getProfileDetails(context);
    totalprice.updateTotalPrice();
  }



  @override
  Widget build(BuildContext context) {
     // print(myResponse!.referalsDetails.length);
    return SafeArea(
      child: Scaffold(
        drawer: CDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primary,
          title: const Text(
            'Dashboard',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    getCartDetils();
                      navigateToCart?Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())):
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>EmptyCart()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 6,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child:  Center(
                        child: Text(
                          totalProducts.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: FutureBuilder<UserDetails>(
            future: _userDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text('Please reload the application'));
              } else {
                final userDetails = snapshot.data!;
                return Column(
                  children: [
                    Flexible(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, // Color of the shadow
                              offset: Offset(0, 1), // Offset of the shadow
                              blurRadius: 4, // Blur radius of the shadow
                              spreadRadius: 0, // Spread radius of the shadow
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/logo.png',
                                height: 70,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userDetails.name,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Welcome to Scriptwarehouse',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: userDetails.profilePic.isNotEmpty
                                      ? CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              userDetails.profilePic),
                                        )
                                      : Container()
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: GridItem())
                  ],
                );
              }
            }),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

//******* Grid View class *** //
class GridItem extends StatelessWidget {
  final ScreenList = [
    Step1(),
    MedicalCertificate(),
    RequestConsultaion(),
    ReferedSpecialist(),
    BloodTestScreen()
  ];

  final List<Map<String, String>> dataList = [
    {
      'icon': 'assets/images/receipt.png',
      'title': 'Request A Script',
    },
    {
      'icon': 'assets/images/doc_receipt.png',
      'title': 'Medical Certificate',
    },
    {
      'icon': 'assets/images/mob.png',
      'title': 'Request Consultation',
    },
    {
      'icon': 'assets/images/doc.png',
      'title': 'Specialist Referral',
    },
    {
      'icon': 'assets/images/micro.png',
      'title': 'Blood Test Request',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // padding: EdgeInsets.all(50),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
      ),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        var screensList = ScreenList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screensList,
              ),
            );
          },
          child: Container(
            height: 80,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade500,
                width: 2.0,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(dataList[index]['icon']!, height: 60),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  dataList[index]['title']!,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}

// ** Bottom Navigation Bar ***** //

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AboutUs(),
    const ContactUs(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    ApiService.getProfileDetails(context);
    setState(() {
      _selectedIndex = index;
    });

    // Use Navigator to push the selected screen onto the stack
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primary,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_support_outlined),
          label: 'About Us',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_in_talk_rounded),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedLabelStyle: const TextStyle(
        color: AppColors.primary, // Set the text color for unselected items
      ),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}
