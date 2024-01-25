import 'package:ezyscripts/screens/Profile%20Screen/profile_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constant/colors.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserDetails> _userDetails;

  @override
  void initState() {
    super.initState();
    _userDetails = ApiService.getProfileDetails();
  }
  // ******** Function to Pick Profile Image ******** //
  final ImagePicker picker = ImagePicker();
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      // Use the picked image file here
      setState(() {
        // Update UI with the picked image
      });
    }
    Navigator.pop(context); // Close the bottom modal sheet
  }

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
      body: FutureBuilder<UserDetails>(
        future: _userDetails,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        final userDetails = snapshot.data!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        child: ClipOval(
                          child: Image.network(userDetails.profilePic),
                        ),
                      ),
                      Positioned(
                          top: 65,
                          left: 60,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: IconButton(onPressed: () {
                                _showImageSourceOptions();
                              },
                                  icon: const Icon(Icons.camera_alt, size: 24,
                                    color: Colors.white,))))
                    ],
                  ),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(userDetails.name,
                        style: const TextStyle(fontSize: 16, color: Colors.black),),
                      IconButton(onPressed: () {
                        _showInputDialog(context);
                      }, icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade400,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.addressCard,
                              color: AppColors.primary,
                              size: 22,
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const  Text('Patient ID:', style: TextStyle(
                                    color: AppColors.primary, fontSize: 16),
                                ),
                                Text(userDetails.id.toString(), style: const TextStyle(
                                    color: Colors.black, fontSize: 14),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        // *** Gender
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           const  FaIcon(
                              FontAwesomeIcons.children,
                              color: AppColors.primary,
                              size: 22,
                            ),
                          const   SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              const   Text('Gender:', style: TextStyle(
                                    color: AppColors.primary, fontSize: 16),
                                ),
                                Text( userDetails.gender.toString(), style: const TextStyle(
                                    color: Colors.black, fontSize: 14),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 10,),
                    //*** Second Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          const   FaIcon(
                              FontAwesomeIcons.calendarDays,
                              color: AppColors.primary,
                              size: 22,
                            ),
                          const   SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const  Text('Date of Birth:', style: TextStyle(
                                    color: AppColors.primary, fontSize: 16),
                                ),
                                Text(userDetails.dob, style: const TextStyle(
                                    color: Colors.black, fontSize: 14),)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15,),
                        // *** Gender
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          const   FaIcon(
                              FontAwesomeIcons.phoneVolume,
                              color: AppColors.primary,
                              size: 22,
                            ),
                          const   SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Contact No:', style: TextStyle(
                                    color: AppColors.primary, fontSize: 16),
                                ),
                                Text(userDetails.contactNumber, style: const TextStyle(
                                    color: Colors.black, fontSize: 14),)
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
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33),
                  child: Column(
                    children: [
                      Row(
                        children: [
                         const  Icon(Icons.mail_outline_outlined,
                            color: AppColors.primary, size: 26,),
                         const  SizedBox(width: 10,),
                          Text(userDetails.email, style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500),)
                        ],
                      ),
                     const  SizedBox(height: 15,),
                      Row(
                        children: [
                        const   Icon(Icons.location_on, color: AppColors.primary,
                            size: 26,),
                          SizedBox(width: 10,),
                          Text(userDetails.address, style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500),)
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade400,
                  thickness: 2,
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 35, right: 20),
                  child: Text(userDetails.about,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: AppColors.primary),),
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
                    child: const Center(child: Text('Deactivate Account',
                      style: TextStyle(fontSize: 16, color: Colors.white),),),
                  ),
                )
              ],
            ),
          ),
        );
      }
    }  ));




  }

  //*** Alert Dialog box for Edit Profile *** //
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


  //********* Function to Open Bottom Sheet ******* //

  Future<void> _showImageSourceOptions() async {
    showModalBottomSheet(

      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top : 15),
            height: MediaQuery.of(context).size.height * 0.18,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Take a photo'),
                  onTap: () {
                    _getImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




