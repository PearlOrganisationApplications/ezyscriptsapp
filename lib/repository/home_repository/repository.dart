// import 'dart:convert';
// import 'package:http/http.dart'as http;
// import 'package:intl/intl.dart';
// import '../../components/toast.dart';
// import '../../constant/colors.dart';
// import '../services/api_class.dart';
//
//  Future<void>medicalCertificate() async {
//   final response = await http.post(
//     Uri.parse(Api.medicalCertificatePost),
//     headers: {'Authorization': 'Bearer $token'},
//     body: jsonEncode({
//       "price": price,
//       "sub_st_date": subStDate,
//       "medicare_card_no": medicareCardNo,
//       "ref_no": refNo,
//       "concession_card_no": concessionCardNo,
//       "card_color": cardColor,
//       "dva_no": dvaNo,
//       "have_allergies": haveAllergies.toString(),
//       "allergy_desc": allergyDesc,
//       "have_medications": haveMedications.toString(),
//       "medication_desc": medicationDesc,
//       "have_medic_history": haveMedicHistory.toString(),
//       "medic_desc": medicDesc,
//       "have_chronic": haveChronic.toString(),
//       "chronic_desc": chronicDesc,
//       "title": title,
//       "dmc": dmc,
//       // Convert DateTime to String
//     }),
//
//   );
//
//   if (response.statusCode == 200) {
//     final result = jsonDecode(response.body);
//     CustomToast.showToast(result['message']);
//   } else {
//     final result = jsonDecode(response.body);
//     print(result);
//     CustomToast.showToast(result['message']);
//   }
// }
