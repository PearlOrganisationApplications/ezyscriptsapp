import 'dart:io';

import 'package:ezyscripts/screens/home/home_screen.dart';
import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/colors.dart';


class CDrawer extends StatelessWidget {
  const CDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Image.asset("assets/images/logo.png"),
          ),
           ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            },
            title: Text('Home'),
          ),
          const ExpansionTile(
            title: Text('What we treat'),
            trailing: Icon(Icons.arrow_drop_down_sharp),
            children: [
              ListTile(
                title: Text(
                  'Weight  loss kit',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Unlock your potential, shed those extra pounds, and embrace a fitter, more '
                        'confident you with our Weight Loss Kit. Start your transformation today!'),
              ),
              ListTile(
                title: Text(
                  'Request a scripts',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Accessing prescriptions for everyday medications, speaking to a doctor, obtaining a medical certificate , getting blood test requests or '
                        'referrals are just some of the online services offered by Ezyscripts.'),
              ),
              ListTile(
                title: Text(
                  'Telehealth consulations',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Speak to a doctor from anywhere in Australia between 6am and '
                        'midnight and get the medical help you need quickly and conveniently.'),
              ),
              ListTile(
                title: Text(
                  'Medical certifiactes',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Need a medical certificate in minutes? With EzyScripts you can get'
                        ' a medical certificate from the comfort of your home'),
              ),
              ListTile(
                title: Text(
                  'Speacilist referals',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Do you need a referral to a specialist doctor? If you need to see a specialist '
                        'we can help you access referrals from the comfort of home.'),
              ),
              ListTile(
                title: Text(
                  'Blood test',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Examines a range of cells, nutrients, hormones and organ function '
                        'indicators in your associated with general health and wellness'),
              ),
            ],
          ),
           ExpansionTile(
            title: Text('About us'),
            trailing: Icon(Icons.arrow_drop_down_sharp),
            children: [
              ListTile(
                onTap: (){
                  _launchURL('https://scriptwarehouse.com.au/about-us/');
                },
                title: Text(
                  'Our Story',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'We aspire to be the leading healthcare platform in Australia, revolutionizing '
                        'the way healthcare is delivered. Our commitment is to make'
                        ' healthcare more accessible and convenient, improving the lives of millions'),
              ),
              ListTile(
                onTap: (){
                  _launchURL('https://scriptwarehouse.com.au/about-us/');
                },
                title: Text(
                  'Our Team',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Discover the skilled and caring individuals shaping EzyScripts success.'
                        ' Meet our team of experienced pharmacists and professionals'
                        ' committed to delivering top-quality healthcare services.'),
              ),
              ListTile(
          onTap: (){
        _launchURL('https://scriptwarehouse.com.au/patient-safety/');
          },
                title: Text(
                  'Patients safety',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'Ezyscripts integrates cutting-edge technologies facilitating online doctor consultations, e-prescriptions, and secure medication delivery. Our platform harnesses the latest advancements to ensure a seamless '
                        'and efficient healthcare experience for users, '
                        'embracing innovation at every step.'),
              ),
              ListTile(
                onTap: (){
                  _launchURL('https://scriptwarehouse.com.au/privacy-policy/');
                },
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(color: AppColors.primary),
                ),
                subtitle: Text(
                    'We respect your rights to privacy and are very conscious of the provisions of the Privacy Act 1988 (Cth) (Privacy Act). The Privacy Act contains the Australian Privacy Principles (APPs) which cover areas including the collection, use, disclosure, quality and security of personal information.'
                        ' We are also conscious of the relevant health privacy '
                        'principles under State and Territory legislation.'),
              ),
            ],
          ),
           ListTile(
            onTap: (){
              _launchURL('https://ezyscripts.com.au/news/');
            },
            title: Text('News'),
          ),
           ListTile(
            onTap: (){
              _launchURL('https://ezyscripts.com.au/book-an-appointment/');
            },
            title: Text('Book an apointment'),
          ),
           ListTile(
             onTap: (){
               _launchURL('https://ezyscripts.com.au/faqs/');
             },
            title: Text('FAQ'),
          ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: InkWell(
              onTap: () async {
            Token.clearToken();
            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen(),))
;              },
              child: Container(
                  alignment: Alignment.center,
                  width: 20,
                  height: 50,
                  color: AppColors.primary,
                  child: Text(
                    'Log out',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    );
  }
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}