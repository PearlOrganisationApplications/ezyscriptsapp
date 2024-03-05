import 'package:country_picker/country_picker.dart';
import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/components/textformfield.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/main.dart';
import 'package:ezyscripts/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class VerifyDetails extends StatefulWidget {
  @override
  State<VerifyDetails> createState() => _VerifyDetailsState();
}

class _VerifyDetailsState extends State<VerifyDetails> {
  String ?_selectedGender;
  final firstName = TextEditingController();
  final contact = TextEditingController();
  final latsName = TextEditingController();

  final email = TextEditingController();
  Country? _selectedCountry;
  final islander = TextEditingController();

  final street = TextEditingController();

  final apartment = TextEditingController();

  final town = TextEditingController();

  final passcode = TextEditingController();

  final state = TextEditingController();

  final emergencyContactName = TextEditingController();

  final emergencyContactMobile = TextEditingController();
  final postCode = TextEditingController();
  final countrty = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify Details', style: TextStyle(
          color: AppColors.primary, fontWeight: FontWeight.w500),),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              formDetails(),
              CustomButton(text: 'Verify Details', onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails(),));
              }, width: screenSize.width * .65,)
            ],
          ),
        ),
      ),
    );
  }

  Widget formDetails() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('First Name*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'Name', controller: firstName),
          SizedBox(height: 10,),
          Text('Last Name*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'Last Name', controller: latsName),
          SizedBox(height: 10,),
          Text('Email*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'email', controller: email),
          SizedBox(height: 10,),
          Text('Phone Number*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          IntlPhoneField(
            controller: contact,
            flagsButtonPadding: const EdgeInsets.all(8),
            dropdownIconPosition: IconPosition.trailing,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
            ),
            initialCountryCode: 'IN',

            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          SizedBox(height: 10,),
          Text('Gender*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedGender,
            onChanged: (String? newValue) {
              setState(() {
                _selectedGender = newValue;
              });
            },
            items: <String>['Male', 'Female', 'Custom']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('Select Gender'),
          ),
          SizedBox(height: 10,),
          Text('islander*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'islander', controller: islander),
          SizedBox(height: 10,),

          Text('Apartment*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'apartment', controller: apartment),
          SizedBox(height: 10,),
          Text('Street*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'street', controller: street),

          SizedBox(height: 10,),
          Text('State*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),

          CustomTextFormField(labelText: 'state', controller: state),
          SizedBox(height: 10,),

          Text('PostCode*', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'postCode', controller: postCode),
          SizedBox(height: 10,),
          Text('Country*', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          TextFormField(

            readOnly: true,
            controller: TextEditingController(
              text: _selectedCountry != null
                  ? '${_selectedCountry!.displayName} (+${_selectedCountry!
                  .phoneCode})'
                  : 'Select country',
            ),
            onTap: _showCountryPicker,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            )
          ),
          SizedBox(height: 10,),

          Text('State*', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'state', controller: state),
          SizedBox(height: 10,),
          Text('Emergency Mobile*', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'Emergency mobile',
              controller: emergencyContactMobile),
          SizedBox(height: 10,),
          Text('Emergeny Name*', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          CustomTextFormField(
              labelText: 'Emergency Name', controller: emergencyContactName),
        ],
      ),
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }
}
