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
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                    radius: 52,
                    child: ClipOval(
                      child: Image.asset('assets/images/profile.png'),
                    ),
                                  ),
                    Positioned(
                        top :65,
                        left: 60,
                        child: Container(
                          height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt, size: 24,color: Colors.white ,))))
                  ],
                ),),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const  Text('User Name', style: TextStyle(fontSize: 16, color: Colors.black),),
                    IconButton(onPressed: (){
                      _showInputDialog(context);
        
                    }, icon: const Icon(Icons.edit))
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
                  SizedBox(width: 10,),
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
                padding:  EdgeInsets.symmetric(horizontal: 33),
                child:  Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.mail_outline_outlined, color: AppColors.primary,size: 26,),
                     SizedBox(width: 10,),
                        Text('User@gmail.com', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),)
                      ],
                    ),
                   SizedBox(height: 15,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.primary,size: 26,),
                     SizedBox(width: 10,),
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
              const Padding(
                padding:  EdgeInsets.only(left: 35, right: 20),
                child:  Text('This is about section',

                  textAlign: TextAlign.justify,
                  style: TextStyle(color: AppColors.primary),),
              ),
              const SizedBox(height: 20,),
              Divider(
                color: Colors.grey.shade400,
                thickness: 2,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(child: Text('Deactivate Account', style: TextStyle(fontSize: 16,color: Colors.white),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  //*** Alert Dailog box for Edit Profile *** //

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController dobController = TextEditingController();
        TextEditingController genderController = TextEditingController();
        TextEditingController aboutController = TextEditingController();

        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Update Your Details', style: TextStyle(color: AppColors.primary),),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: dobController,

                  decoration: const InputDecoration(labelText: 'Date of Birth', ),
                ),
                TextField(
                  controller: genderController,

                  decoration: const  InputDecoration(labelText: 'Gender',

                  ),
                ),
                TextField(
                  controller: aboutController,
                  decoration: const InputDecoration(labelText: 'About'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: AppColors.primary),),
            ),
            TextButton(
              onPressed: () {
                if (_validateData(
                    dobController.text, genderController.text, aboutController.text)) {
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter valid data'),
                    ),
                  );
                }
              },
              child: const Text('Save', style: TextStyle(color: AppColors.primary),),
            ),
          ],
        );
      },
    );
  }
  bool _validateData(String dob, String gender, String about) {
    if (dob.isEmpty || gender.isEmpty || about.isEmpty) {
      return false;
    }
    return true;
  }

}


