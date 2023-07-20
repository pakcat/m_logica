// To parse this JSON data, do
//
//     final si = siFromJson(jsonString);

import 'dart:convert';

List<Si> siFromJson(String str) =>
    List<Si>.from(json.decode(str).map((x) => Si.fromJson(x)));

String siToJson(List<Si> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Si {
  Si({
    this.iDSi,
    this.reQEta,
    this.fullfilLEta,
    this.trucKType,
    this.routEId,
    this.creatEDate,
    this.updatEDate,
    this.siBooking,
    this.storeS,
  });

  String? iDSi;
  DateTime? reQEta;
  DateTime? fullfilLEta;
  String? trucKType;
  int? routEId;
  DateTime? creatEDate;
  DateTime? updatEDate;
  SiBooking? siBooking;
  List<Store>? storeS;

  factory Si.fromJson(Map<String, dynamic> json) => Si(
        iDSi: json["iD_SI"],
        reQEta:
            json["reQ_ETA"] == null ? null : DateTime.parse(json["reQ_ETA"]),
        fullfilLEta: json["fullfilL_ETA"] == null
            ? null
            : DateTime.parse(json["fullfilL_ETA"]),
        trucKType: json["trucK_TYPE"],
        routEId: json["routE_ID"],
        creatEDate: json["creatE_DATE"] == null
            ? null
            : DateTime.parse(json["creatE_DATE"]),
        updatEDate: json["updatE_DATE"] == null
            ? null
            : DateTime.parse(json["updatE_DATE"]),
        siBooking: json["siBooking"] == null
            ? null
            : SiBooking.fromJson(json["siBooking"]),
        storeS: json["_storeS"] == null
            ? []
            : List<Store>.from(json["_storeS"]!.map((x) => Store.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "iD_SI": iDSi,
        "reQ_ETA": reQEta?.toIso8601String(),
        "fullfilL_ETA": fullfilLEta?.toIso8601String(),
        "trucK_TYPE": trucKType,
        "routE_ID": routEId,
        "creatE_DATE": creatEDate?.toIso8601String(),
        "updatE_DATE": updatEDate?.toIso8601String(),
        "siBooking": siBooking?.toJson(),
        "_storeS": storeS == null
            ? []
            : List<dynamic>.from(storeS!.map((x) => x.toJson())),
      };
}

class SiBooking {
  SiBooking({
    this.iDSi,
    this.iDRoute,
    this.bkgref,
    this.bookinGMasterScm,
    this.bookinGScm,
    this.pol,
    this.pod,
    this.contracTNo,
    this.plaTNo,
    this.driveRName,
    this.sj,
    this.bast,
    this.vessel,
    this.doorinGPlan,
    this.doorinGNopol,
    this.doorinGDriver,
    this.containeRNo,
    this.leaDTime,
    this.iSDiscrepency,
    this.iSDorring,
    this.creatEDate,
    this.updatEDate,
  });

  String? iDSi;
  int? iDRoute;
  String? bkgref;
  String? bookinGMasterScm;
  String? bookinGScm;
  String? pol;
  String? pod;
  String? contracTNo;
  String? plaTNo;
  String? driveRName;
  String? sj;
  String? bast;
  String? vessel;
  DateTime? doorinGPlan;
  dynamic doorinGNopol;
  dynamic doorinGDriver;
  String? containeRNo;
  int? leaDTime;
  bool? iSDiscrepency;
  bool? iSDorring;
  DateTime? creatEDate;
  DateTime? updatEDate;

  factory SiBooking.fromJson(Map<String, dynamic> json) => SiBooking(
        iDSi: json["iD_SI"],
        iDRoute: json["iD_ROUTE"],
        bkgref: json["bkgref"],
        bookinGMasterScm: json["bookinG_MASTER_SCM"],
        bookinGScm: json["bookinG_SCM"],
        pol: json["pol"],
        pod: json["pod"],
        contracTNo: json["contracT_NO"],
        plaTNo: json["plaT_NO"],
        driveRName: json["driveR_NAME"],
        sj: json["sj"],
        bast: json["bast"],
        vessel: json["vessel"],
        doorinGPlan: json["doorinG_PLAN"] == null
            ? null
            : DateTime.parse(json["doorinG_PLAN"]),
        doorinGNopol: json["doorinG_NOPOL"],
        doorinGDriver: json["doorinG_DRIVER"],
        containeRNo: json["containeR_NO"],
        leaDTime: json["leaD_TIME"],
        iSDiscrepency: json["iS_DISCREPENCY"],
        iSDorring: json["iS_DORRING"],
        creatEDate: json["creatE_DATE"] == null
            ? null
            : DateTime.parse(json["creatE_DATE"]),
        updatEDate: json["updatE_DATE"] == null
            ? null
            : DateTime.parse(json["updatE_DATE"]),
      );

  Map<String, dynamic> toJson() => {
        "iD_SI": iDSi,
        "iD_ROUTE": iDRoute,
        "bkgref": bkgref,
        "bookinG_MASTER_SCM": bookinGMasterScm,
        "bookinG_SCM": bookinGScm,
        "pol": pol,
        "pod": pod,
        "contracT_NO": contracTNo,
        "plaT_NO": plaTNo,
        "driveR_NAME": driveRName,
        "sj": sj,
        "bast": bast,
        "vessel": vessel,
        "doorinG_PLAN": doorinGPlan?.toIso8601String(),
        "doorinG_NOPOL": doorinGNopol,
        "doorinG_DRIVER": doorinGDriver,
        "containeR_NO": containeRNo,
        "leaD_TIME": leaDTime,
        "iS_DISCREPENCY": iSDiscrepency,
        "iS_DORRING": iSDorring,
        "creatE_DATE": creatEDate?.toIso8601String(),
        "updatE_DATE": updatEDate?.toIso8601String(),
      };
}

class Store {
  Store({
    this.iDSi,
    this.storECode,
    this.storEName,
    this.city,
    this.region,
    this.island,
  });

  String? iDSi;
  int? storECode;
  String? storEName;
  String? city;
  String? region;
  String? island;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        iDSi: json["iD_SI"],
        storECode: json["storE_CODE"],
        storEName: json["storE_NAME"],
        city: json["city"],
        region: json["region"],
        island: json["island"],
      );

  Map<String, dynamic> toJson() => {
        "iD_SI": iDSi,
        "storE_CODE": storECode,
        "storE_NAME": storEName,
        "city": city,
        "region": region,
        "island": island,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
