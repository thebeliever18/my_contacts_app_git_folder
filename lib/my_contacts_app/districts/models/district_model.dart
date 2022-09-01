// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

List<DistrictModel> districtModelFromJson(String str) => List<DistrictModel>.from(json.decode(str).map((x) => DistrictModel.fromJson(x)));

String districtModelToJson(List<DistrictModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DistrictModel {
   
    final int? distId;
    final String? distName;
    final int? zoneId;
    final String? distNameNep;
    final int? provinceId;

     DistrictModel({
        this.distId,
        this.distName,
        this.zoneId,
        this.distNameNep,
        this.provinceId,
    });
    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        distId: json["dist_id"],
        distName: json["dist_name"],
        zoneId: json["zone_id"],
        distNameNep: json["dist_name_nep"],
        provinceId: json["province_id"],
    );

    Map<String, dynamic> toJson() => {
        "dist_id": distId,
        "dist_name": distName,
        "zone_id": zoneId,
        "dist_name_nep": distNameNep,
        "province_id": provinceId,
    };
}
