import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'bottomscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDoctorSelected = false;
  bool isPatientSelected = false;
    final _email=TextEditingController();
    final _password=TextEditingController();
  bool passwordShow=false;
  bool rememberMe = false;
  final _formey=GlobalKey<FormState>();
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
        elevation: 5,
        title: const Text(
          'Login Here',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    color: AppColors.primary,
                  ),
                  Positioned(

                    left: 60,
                    right: 60,
                    bottom: -6,
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
                  isDoctorSelected = true;
                  isPatientSelected = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: isDoctorSelected ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Doctor',
                  style: TextStyle(
                    color: isDoctorSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  isDoctorSelected = false;
                  isPatientSelected = true;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: isPatientSelected ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Patient',
                  style: TextStyle(
                    color: isPatientSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
                ),

              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: TextFormField(
                  controller: _email,
                  autofillHints: [AutofillHints.email],
                  validator: (value) => value?.isEmpty ?? true
                      ? "Username is required"
                      : null,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Username', // Add your desired label text
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: TextFormField(
                  controller: _password,
                  autofillHints: [AutofillHints.password],
                  obscureText: !passwordShow,
                  validator: (value) => value?.isEmpty ?? true
                      ? "password is required"
                      : null,
                  decoration:  InputDecoration(

                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        passwordShow = !passwordShow;
                      });
                    },
                        icon:passwordShow?
                        const Icon(Icons.visibility)
                            :Icon(Icons.visibility_off)),// Add your desired prefix icon
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
                      onPressed: (){
                        if(_formey.currentState!.validate()){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomBar()));

                        }
                      }, child: const Text('Login',style: TextStyle(color: Colors.white),)))
            ],

          ),
        ),
      ),
    );
  }
}
