import 'package:http/http.dart' as http;

import '../../constant/colors.dart';
import '../services/api_class.dart';

Future<void> requestScript() async {
  final response = await http.post(Uri.parse(Api.requestScript)
    , headers: {
      'Authorization': 'Bearer $token' // Typo corrected from 'BearToken' to 'Bearer'
    },
    body: {
          "product_name"
          "medicare_card_no"
          "ref_no"
          "concession_card_no"
          "card_color"
          "dva_no"
          "have_allergies"
          "allergy_desc"
          "have_medications"
          "medication_desc"
          "have_medic_history"
          "medic_desc"
          "have_chronic"
          "chronic_desc"
    },
  );// Handle the response here
}
