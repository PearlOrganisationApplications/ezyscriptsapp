import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/components/percentindicator.dart';
import 'package:ezyscripts/components/toast.dart';
import 'package:ezyscripts/main.dart';
import 'package:ezyscripts/screens/refil/my_refil.dart';
import 'package:flutter/material.dart';


class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
   String selectedOption='';
   bool option1Selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 68.0),
        child: Column(
          children: [
            step1()
          ],
        ),
      ),
    );
  }

  Widget step1(){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
                child: Text("Step 1 of 3")),
            SizedBox(height: 10,),
            ProgressIndicatorContainer(percent: 0.33,text: '33%'),
            SizedBox(height: 20,),
            Text('How Would You Like To Recieve Your medication',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
            // ListTile(
            //   title: const Text('I would like my medication to be deliverd to my door via Express Post'),
            //   leading: Radio(
            //     value:'option1',
            //     groupValue: selectedOption,
            //     onChanged: handleRadioValueChanged
            //   ),
            // ),
            ListTile(
              title: const Text('I would like my medication to be delivered to my door via Express Post'),
              leading: Checkbox(
                value: option1Selected,
                onChanged: (bool? value) {
                  setState(() {
                    option1Selected = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'Next',
              onPressed: (){
                if (option1Selected) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Refil()));
                } else {
                  CustomToast.showToast('This Field is required?');
                }
              },width: screenSize.width*0.35,)

          ],
        ),
      ),
    );
  }
   void handleRadioValueChanged(String? value) {
     setState(() {
       selectedOption = value!;
     });
   }
}
