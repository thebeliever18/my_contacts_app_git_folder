// To parse this JSON data, do
//
//     final provinceModel = provinceModelFromJson(jsonString);

import 'dart:convert';

List<ProvinceModel> provinceModelFromJson(String str) => List<ProvinceModel>.from(json.decode(str).map((x) => ProvinceModel.fromJson(x)));

String provinceModelToJson(List<ProvinceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProvinceModel {
    final int? stateId;
    final String? name;
    final String? nameNp;

    ProvinceModel({
        this.stateId,
        this.name,
        this.nameNp,
    });
    
    factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        stateId: json["state_id"],
        name: json["name"],
        nameNp: json["name_np"],
    );

    Map<String, dynamic> toJson() => {
        "state_id": stateId,
        "name": name,
        "name_np": nameNp,
    };
}
