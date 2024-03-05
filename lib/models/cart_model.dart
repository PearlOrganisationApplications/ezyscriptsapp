import 'dart:convert';

class MyResponse {
  bool status;
  List<CartDetails> scriptDetails;
  List<CertificateDetail> certificateDetails;
  List<ConsultationDetail> consultationDetail;

  MyResponse({
    required this.status,
    required this.scriptDetails,
    required this.certificateDetails,
    required this.consultationDetail,
  });

  factory MyResponse.fromJson(Map<String, dynamic> json) {
    return MyResponse(
      status: json['status'],
      scriptDetails: List<CartDetails>.from(json['script_details'].map((x) => CartDetails.fromJson(x))),
      certificateDetails: List<CertificateDetail>.from(json['certificate_details'].map((x) => CertificateDetail.fromJson(x))),
      consultationDetail: List<ConsultationDetail>.from(json['consultation_details'].map((x) => ConsultationDetail.fromJson(x))),
    );
  }
}

class CartDetails {
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
  String? allergyDesc;
  String haveMedications;
  String? medicationDesc;
  String haveMedicHistory;
  String? medicDesc;
  String haveChronic;
  List<String>? chronicDesc;
  String paymentStatus;

  CartDetails({
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
    this.allergyDesc,
    required this.haveMedications,
    this.medicationDesc,
    required this.haveMedicHistory,
    this.medicDesc,
    required this.haveChronic,
    this.chronicDesc,
    required this.paymentStatus,
  });

  factory CartDetails.fromJson(Map<String, dynamic> json) {
    return CartDetails(
      id: json['id'],
      userId: json['user_id'],
      productName: json['product_name'],
      productPrice: json['product_price'],
      medicareCardNo: json['medicare_card_no'],
      refNo: json['ref_no'],
      concessionCardNo: json['concession_card_no'],
      cardColor: json['card_color'],
      dvaNo: json['dva_no'],
      haveAllergies: json['have_allergies'],
      allergyDesc: json['allergy_desc'],
      haveMedications: json['have_medications'],
      medicationDesc: json['medication_desc'],
      haveMedicHistory: json['have_medic_history'],
      medicDesc: json['medic_desc'],
      haveChronic: json['have_chronic'],
      chronicDesc: json['chronic_desc'] != null ? List<String>.from(json['chronic_desc']) : null,
      paymentStatus: json['payment_status'],
    );
  }
}
class CertificateDetail {
  int id;
  int userId;
  DateTime subDate;
  String price;
  int medicareCardNo;
  int refNo;
  int concessionCardNo;
  String dvaNo;
  String cardColor;
  String haveAllergies;
  String allergyDesc;
  String haveMedications;
  String medicationDesc;
  String haveMedicHistory;
  String medicDesc;
  String haveChronic;
  List<String> chronicDesc;
  String title;
  List<String> dmc;
  String requestReason;
  String paymentStatus;

  CertificateDetail({
    required this.id,
    required this.userId,
    required this.subDate,
    required this.price,
    required this.medicareCardNo,
    required this.refNo,
    required this.concessionCardNo,
    required this.dvaNo,
    required this.cardColor,
    required this.haveAllergies,
    required this.allergyDesc,
    required this.haveMedications,
    required this.medicationDesc,
    required this.haveMedicHistory,
    required this.medicDesc,
    required this.haveChronic,
    required this.chronicDesc,
    required this.title,
    required this.dmc,
    required this.requestReason,
    required this.paymentStatus,
  });

  factory CertificateDetail.fromJson(Map<String, dynamic> json) => CertificateDetail(
    id: json["id"],
    userId: json["user_id"],
    subDate: DateTime.parse(json["sub_date"]),
    price: json["price"] ?? "", // Provide a default empty string if price is null
    medicareCardNo: json["medicare_card_no"],
    refNo: json["ref_no"],
    concessionCardNo: json["concession_card_no"],
    dvaNo: json["dva_no"] ?? "", // Provide a default empty string if dvaNo is null
    cardColor: json["card_color"] ?? "", // Provide a default empty string if cardColor is null
    haveAllergies: json["have_allergies"] ?? "", // Provide a default empty string if haveAllergies is null
    allergyDesc: json["allergy_desc"] ?? "", // Provide a default empty string if allergyDesc is null
    haveMedications: json["have_medications"] ?? "", // Provide a default empty string if haveMedications is null
    medicationDesc: json["medication_desc"] ?? "", // Provide a default empty string if medicationDesc is null
    haveMedicHistory: json["have_medic_history"] ?? "", // Provide a default empty string if haveMedicHistory is null
    medicDesc: json["medic_desc"] ?? "", // Provide a default empty string if medicDesc is null
    haveChronic: json["have_chronic"] ?? "", // Provide a default empty string if haveChronic is null
    chronicDesc: json["chronic_desc"] != null ? List<String>.from(json["chronic_desc"]) : [], // Provide an empty list if chronicDesc is null
    title: json["title"] ?? "", // Provide a default empty string if title is null
    dmc: json["dmc"] != null ? List<String>.from(json["dmc"]) : [], // Provide an empty list if dmc is null
    requestReason: json["request_reason"] ?? "", // Provide a default empty string if requestReason is null
    paymentStatus: json["payment_status"] ?? "", // Provide a default empty string if paymentStatus is null
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "sub_date": "${subDate.year.toString().padLeft(4, '0')}-${subDate.month.toString().padLeft(2, '0')}-${subDate.day.toString().padLeft(2, '0')}",
    "price": price,
    "medicare_card_no": medicareCardNo,
    "ref_no": refNo,
    "concession_card_no": concessionCardNo,
    "dva_no": dvaNo,
    "card_color": cardColor,
    "have_allergies": haveAllergies,
    "allergy_desc": allergyDesc,
    "have_medications": haveMedications,
    "medication_desc": medicationDesc,
    "have_medic_history": haveMedicHistory,
    "medic_desc": medicDesc,
    "have_chronic": haveChronic,
    "chronic_desc": List<dynamic>.from(chronicDesc.map((x) => x)),
    "title": title,
    "dmc": List<dynamic>.from(dmc.map((x) => x)),
    "request_reason": requestReason,
    "payment_status": paymentStatus,
  };
}
class ConsultationDetail {
  int id;
  int userId;
  DateTime subStDate;
  String price;
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
  List<String> dmc;
  String requestReason;
  String title;
  dynamic contact;
  String paymentStatus;

  ConsultationDetail({
    required this.id,
    required this.userId,
    required this.subStDate,
    required this.price,
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
    required this.dmc,
    required this.requestReason,
    required this.title,
    required this.contact,
    required this.paymentStatus,
  });

  factory ConsultationDetail.fromJson(Map<String, dynamic> json) => ConsultationDetail(
    id: json["id"],
    userId: json["user_id"],
    subStDate: DateTime.parse(json["sub_st_date"]),
    price: json["price"],
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
    dmc: List<String>.from(json["dmc"].map((x) => x)),
    requestReason: json["request_reason"],
    title: json["title"],
    contact: json["contact"],
    paymentStatus: json["payment_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "sub_st_date": "${subStDate.year.toString().padLeft(4, '0')}-${subStDate.month.toString().padLeft(2, '0')}-${subStDate.day.toString().padLeft(2, '0')}",
    "price": price,
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
    "dmc": List<dynamic>.from(dmc.map((x) => x)),
    "request_reason": requestReason,
    "title": title,
    "contact": contact,
    "payment_status": paymentStatus,
  };
}



