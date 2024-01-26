import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../Profile Screen/profile_api.dart';
import '../Profile Screen/profile_screen.dart';
import '../about_us/about_us.dart';
import '../contact_us/contact_us.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UserDetails> _userDetails;

  @override
  void initState() {
    super.initState();
    _userDetails = ApiService.getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primary,
          title: const Text(
            'Dashboard',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          leading: const Text(''),
          leadingWidth: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                ))
          ],
        ),
        body: FutureBuilder<UserDetails>(
            future: _userDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
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
                                      'Welcome to Ezyscript',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                    child: Image.network(
                                  userDetails.profilePic,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'App Version: ',
                                  style: TextStyle(
                                      color: AppColors.text, fontSize: 16),
                                ),
                                Text(
                                  '6.4.0',
                                  style: TextStyle(
                                      color: AppColors.text, fontSize: 16),
                                )
                              ],
                            )
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
        return Container(
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
