import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constant/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Profile', style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, ),
        child: Column(
          children: [
            Center(child: CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.asset('assets/images/profile.png'),
              ),
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User Name', style: TextStyle(fontSize: 16, color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.addressCard,
                          color: AppColors.primary,
                          size: 22,
                        ),
                         SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text('Patient ID:', style: TextStyle(color: AppColors.primary, fontSize: 16),
                            ),
                            Text('25226', style: TextStyle(color: Colors.black, fontSize: 14),)
                          ],
                        )
                      ],
                    ),
                 SizedBox(height: 15,),
                    // *** Gender
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.children,
                           color: AppColors.primary,
                          size: 22,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text('Gender:', style: TextStyle(color: AppColors.primary, fontSize: 16),
                            ),
                            Text('Female', style: TextStyle(color: Colors.black, fontSize: 14),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                //*** Second Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.calendarDays,
                          color: AppColors.primary,
                          size: 22,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text('Date of Birth:', style: TextStyle(color: AppColors.primary, fontSize: 16),
                            ),
                            Text('01/01/1997', style: TextStyle(color: Colors.black, fontSize: 14),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    // *** Gender
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.phoneVolume,
                          color: AppColors.primary,
                          size: 22,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text('Contact No:', style: TextStyle(color: AppColors.primary, fontSize: 16),
                            ),
                            Text('(828)-742-1192', style: TextStyle(color: Colors.black, fontSize: 14),)
                          ],
                        )
                      ],
                    )
                  ],
                )

              ],
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child:  Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.mail_outline_outlined, color: AppColors.primary,size: 26,),
                      const SizedBox(width: 10,),
                      Text('User@gmail.com', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: AppColors.primary,size: 26,),
                      const SizedBox(width: 10,),
                      Text('Street 5', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),)
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
            ),
            const SizedBox(height: 20,),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('Deactivate Account', style: TextStyle(fontSize: 16,color: Colors.white),),),
            )
          ],
        ),
      ),
    );
  }
}
