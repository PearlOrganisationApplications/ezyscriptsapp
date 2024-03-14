import 'package:csv/csv.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/screens/refil/step1/step3_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/percentindicator.dart';
import '../../components/toast.dart';
import '../../main.dart';

class Refil extends StatefulWidget {
  const Refil({super.key});

  @override
  State<Refil> createState() => _RefilState();
}

class _RefilState extends State<Refil> {
  final mediacreController=TextEditingController();
  final refNumController=TextEditingController();
  final conseCardController=TextEditingController();
  final DavController=TextEditingController();
  final specifyAlergiesController=TextEditingController();
  final specifyMediationsController=TextEditingController();
  final medicalHistoryController=TextEditingController();
  List<String> dropdownItems = [];
  String search='';
  late TextEditingController _searchController;
  late List<String> _filteredDropdownItems;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredDropdownItems = List.from(dropdownItems);
    loadDropdownItems();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadDropdownItems() async {
    String csvData = await rootBundle.loadString('assets/images/Ezyscript_prices.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);
    List<String> items = [];
    for (var row in csvTable) {
      String drugName = row[0].toString();
      String privatePrice = row[1].toString();
      // Concatenate drug name and private patient price
      String dropdownItem = '$drugName - $privatePrice';
      items.add(dropdownItem);
    }
    setState(() {
      dropdownItems = items;
    });
    print(items);
  }
  String? _selectedOption;


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:  Padding(
        padding: const EdgeInsets.only(top: 48.0,left: 10),
        child: Column(
          children: [
            step1(),
            SizedBox(height: 30,),
            previousNext()

          ],
        ),
      ),
    );
  }

  Widget step1(){
    return Container(
      child: Column(
        children: [
        Align(
          alignment: Alignment.centerLeft,
            child: Text('Step 2 of 3')),
          SizedBox(height: 10,
          ),
          SizedBox(height: 20,),
          ProgressIndicatorContainer(percent: 0.6,text: '66%') ,
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topLeft,
              child: Text('Select Product',style: TextStyle(fontWeight: FontWeight.w700),)),
          SizedBox(height: 20,),


          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              showSearchBox: true,
            ),
            items:dropdownItems,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select a post",
                hintText: "select a post",
              ),
            ),
            onChanged: (value){
              setState(() {
                _selectedOption=value;
              });
            },
            selectedItem: _selectedOption,
          )

        ],
      ),
    );
  }
  Widget previousNext(){
    return Row(
      children: [
        CustomButton(text: 'Previous', onPressed: (){},width: screenSize.width*0.34,),
        SizedBox(width: 15,),
        CustomButton(text: 'Next', onPressed: (){
          _selectedOption==null?CustomToast.showToast('Please select the post'):Navigator.push(context, MaterialPageRoute(builder: (context) => Step3(productName:_selectedOption.toString() ),));
        },
          width: screenSize.width*0.34,),
      ],
    );
  }
}
