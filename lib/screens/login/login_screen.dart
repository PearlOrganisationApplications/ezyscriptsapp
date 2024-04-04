
import 'package:flutter/material.dart';

import '../../components/textsize.dart';
import '../../components/validator.dart';
import '../../constant/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>with FormValidationMixin{
  bool enable=false;
  @override
  void initState() {
    super.initState();

    // Listen for changes in the text field
    email1.addListener(() {
      setState(() {
        // Update the visibility of the login button based on whether the text field is empty or not
        enable = email1.text.isNotEmpty;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
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
          key: formey,
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
              const SizedBox(height: 10,),
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
                  controller: email1,
                  autofillHints: const [AutofillHints.email],
                  validator: validateUserName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Email', // Add your desired label text
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: TextFormField(
                  controller: password1,
                  autofillHints: const [AutofillHints.password],
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
                            :const Icon(Icons.visibility_off)),// Add your desired prefix icon
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
                  const Text('Remember Me'),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.97,
                  child:enable? ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary), // Replace 'Colors.blue' with your desired color
                      ),
                      onPressed: ()async{
                        if(formey.currentState!.validate()){
                          userLogin(context);
                        }
                      }, child:  Text('Login',style:AppStyles.subtitleStyle().copyWith(color: Colors.white)
                  )
                  ):Container()
              )
            ],
          ),
        ),
      ),
    );
  }
}
