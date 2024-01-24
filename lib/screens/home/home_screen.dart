import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../appointment/my_appointment.dart';
import '../document/my_document.dart';
import '../pharmacy/my_pharmacy.dart';
import '../prescription/my_prescription.dart';
import '../refil/my_refill.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children:  [
                 DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                  ),
                  child: Image.asset(
                    "assets/images/EzyScript1-155x108.png"
                  ),
                ),
                const ListTile(
                  title: Text('Home'),
                ),
                const ExpansionTile(
                  title: Text('What we treat'),
                    trailing:Icon(Icons.arrow_drop_down_sharp),
                  children: [
                    ListTile(
                      title: Text('Weight  loss kit',style: TextStyle(color: AppColors.primary),),
                        subtitle: Text('Unlock your potential, shed those extra pounds, and embrace a fitter, more '
                            'confident you with our Weight Loss Kit. Start your transformation today!'),
                    ),
                    ListTile(
                      title: Text('Request a scripts',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('Accessing prescriptions for everyday medications, speaking to a doctor, obtaining a medical certificate , getting blood test requests or '
                          'referrals are just some of the online services offered by Ezyscripts.'),
                    ),
                    ListTile(
                      title: Text('Telehealth consulations',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('Speak to a doctor from anywhere in Australia between 6am and '
                          'midnight and get the medical help you need quickly and conveniently.'),
                    ),
                    ListTile(
                      title: Text('Medical certifiactes',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('Need a medical certificate in minutes? With EzyScripts you can get'
                          ' a medical certificate from the comfort of your home'),
                    ),
                    ListTile(
                      title: Text('Speacilist referals',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('Do you need a referral to a specialist doctor? If you need to see a specialist '
                          'we can help you access referrals from the comfort of home.'),
                    ),
                    ListTile(
                      title: Text('Blood test',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('Examines a range of cells, nutrients, hormones and organ function '
                          'indicators in your associated with general health and wellness'),
                    ),

                  ],
                ),
                const ExpansionTile(
                  title: Text('About us'),
                    trailing:Icon(Icons.arrow_drop_down_sharp),
                  children: [
                    ListTile(
                      title: Text('Our Story',style: TextStyle(color: AppColors.primary),),
                       subtitle: Text('We aspire to be the leading healthcare platform in Australia, revolutionizing '
                           'the way healthcare is delivered. Our commitment is to make'
                           ' healthcare more accessible and convenient, improving the lives of millions'),
                    ),
                    ListTile(
                      title: Text('Our Team',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('Discover the skilled and caring individuals shaping EzyScripts success.'
                          ' Meet our team of experienced pharmacists and professionals'
                          ' committed to delivering top-quality healthcare services.'),
                    ),
                    ListTile(
                      title: Text('Patients safety',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('Ezyscripts integrates cutting-edge technologies facilitating online doctor consultations, e-prescriptions, and secure medication delivery. Our platform harnesses the latest advancements to ensure a seamless '
                          'and efficient healthcare experience for users, '
                          'embracing innovation at every step.'),
                    ),
                    ListTile(
                      title: Text('Privacy Policy',style: TextStyle(color: AppColors.primary),),
                      subtitle: Text('We respect your rights to privacy and are very conscious of the provisions of the Privacy Act 1988 (Cth) (Privacy Act). The Privacy Act contains the Australian Privacy Principles (APPs) which cover areas including the collection, use, disclosure, quality and security of personal information.'
                          ' We are also conscious of the relevant health privacy '
                          'principles under State and Territory legislation.'),
                    ),
                  ],
                ),
                const ListTile(
                  title: Text('News'),
                ),
                 const ListTile(
                  title: Text('Book an apointment'),
                ),
                const ListTile(
                  title: Text('FAQ'),
                ),
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 50,
                    color: AppColors.primary,
                    child:Text('Log out',style: TextStyle(color: Colors.white),)
                  ),
                )
              ],
            ),

          ),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primary ,
          title: const Text('Dashboard',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
          ),
          actions: [
            IconButton(onPressed: (){},
                icon : const Icon(Icons.power_settings_new, color: Colors.white,))
          ],
        ),
        body: Column(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
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
                     child: Image.asset('assets/images/logo.png',height: 70,),
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     const   Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('User Name,', style: TextStyle(
                               color: AppColors.primary,
                               fontSize: 16,
                               fontWeight: FontWeight.w500
                           ),),
                          SizedBox(height: 6),
                          Text('Welcome to Ezyscript',
                             style: TextStyle(
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                       ClipRRect(child: Image.asset('assets/images/camera.png', height: 80, width: 80,
                       fit: BoxFit.cover,
                       ))
                     ],
                   ),

                  const SizedBox(height: 10,),
                  const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('App Version: ', style: TextStyle(
                         color: AppColors.text,
                         fontSize: 16
                       ),),
                       Text('6.4.0', style: TextStyle(
                           color: AppColors.text,
                           fontSize: 16
                       ),)
                     ],
                   )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                height: MediaQuery.of(context).size.height * 0.50,
                child: GridItem()
            )
          ],
        ),

      ),
    );
  }
}


//******* Grid View class *** //
class GridItem extends StatelessWidget {
  final  ScreenList=[
    MyRefill(),
    MyDocument(),
    MyPrescription(),
    MyPharmacy(doctors: [],),

    MyAppointment()

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
    return
      GridView.builder(
       // padding: EdgeInsets.all(50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 6.0,
        ),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          var screens=ScreenList[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => screens,
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
                    const SizedBox(height: 6,),
                    Text(
                      dataList[index]['title']!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                )


              ),
            ),
          );
        },

    );

  }
}

// ** Bottom Navigation Bar ***** //




