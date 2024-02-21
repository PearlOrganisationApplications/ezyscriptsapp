// To parse this JSON data, do
//
//     final cardDetails = cardDetailsFromJson(jsonString);

import 'dart:convert';

CardDetails cardDetailsFromJson(String str) => CardDetails.fromJson(json.decode(str));

String cardDetailsToJson(CardDetails data) => json.encode(data.toJson());

class CardDetails {
  bool status;
  List<ScriptDetail> scriptDetails;

  CardDetails({
    required this.status,
    required this.scriptDetails,
  });

  factory CardDetails.fromJson(Map<String, dynamic> json) => CardDetails(
    status: json["status"],
    scriptDetails: List<ScriptDetail>.from(json["script_details"].map((x) => ScriptDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "script_details": List<dynamic>.from(scriptDetails.map((x) => x.toJson())),
  };
}

class ScriptDetail {
  int id;
  int userId;
  String productName;
  String productPrice;
  int medicareCardNo;
  int refNo;
  int concessionCardNo;
  String cardColor;
  String dvaNo;
  String haveAllergies;
  String allergyDesc;
  String haveMedications;
  String medicationDesc;
  String haveMedicHistory;
  String medicDesc;
  String haveChronic;
  List<String> chronicDesc;

  ScriptDetail({
    required this.id,
    required this.userId,
    required this.productName,
    required this.productPrice,
    required this.medicareCardNo,
    required this.refNo,
    required this.concessionCardNo,
    required this.cardColor,
    required this.dvaNo,
    required this.haveAllergies,
    required this.allergyDesc,
    required this.haveMedications,
    required this.medicationDesc,
    required this.haveMedicHistory,
    required this.medicDesc,
    required this.haveChronic,
    required this.chronicDesc,
  });

  factory ScriptDetail.fromJson(Map<String, dynamic> json) => ScriptDetail(
    id: json["id"],
    userId: json["user_id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    medicareCardNo: json["medicare_card_no"],
    refNo: json["ref_no"],
    concessionCardNo: json["concession_card_no"],
    cardColor: json["card_color"],
    dvaNo: json["dva_no"],
    haveAllergies: json["have_allergies"],
    allergyDesc: json["allergy_desc"],
    haveMedications: json["have_medications"],
    medicationDesc: json["medication_desc"],
    haveMedicHistory: json["have_medic_history"],
    medicDesc: json["medic_desc"],
    haveChronic: json["have_chronic"],
    chronicDesc: List<String>.from(json["chronic_desc"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_name": productName,
    "product_price": productPrice,
    "medicare_card_no": medicareCardNo,
    "ref_no": refNo,
    "concession_card_no": concessionCardNo,
    "card_color": cardColor,
    "dva_no": dvaNo,
    "have_allergies": haveAllergies,
    "allergy_desc": allergyDesc,
    "have_medications": haveMedications,
    "medication_desc": medicationDesc,
    "have_medic_history": haveMedicHistory,
    "medic_desc": medicDesc,
    "have_chronic": haveChronic,
    "chronic_desc": List<dynamic>.from(chronicDesc.map((x) => x)),
  };
}
