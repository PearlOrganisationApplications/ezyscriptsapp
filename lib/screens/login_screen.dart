import 'package:flutter/material.dart';

import '../constant/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isFirstContainerTapped = false;
  bool isSecondContainerTapped = false;
  bool passwordShow=false;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: const Text(
          'Login Here',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                color: AppColors.primary,
              ),
              Positioned(
                top: 110,
                left: 60,
                right: 60,
                child: Container(
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/EzyScript1-155x108.png'), // Replace 'name' with your actual image path
                    ),
                  ),
                  height: 90,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstContainerTapped = !isFirstContainerTapped;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color:
                    isFirstContainerTapped ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
               child: const Text('Doctor',style: TextStyle(color: Colors.white))
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSecondContainerTapped = !isSecondContainerTapped;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                  color: isSecondContainerTapped ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: const Text('Patient',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Username', // Add your desired label text
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: TextFormField(
              decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(onPressed: () {},
                    icon:passwordShow? const Icon(Icons.remove_red_eye):Icon(Icons.remove_red_eye)),// Add your desired prefix icon
                labelText: 'password', // Add your desired label text
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: ( value) {
                  setState(() {
                    rememberMe = value!;
                  });
                },
              ),
              Text('Remember Me'),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.97,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary), // Replace 'Colors.blue' with your desired color
                  ),
                  onPressed: (){}, child: const Text('Login',style: TextStyle(color: Colors.white),)))
        ],

      ),
    );
  }
}
