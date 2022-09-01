// To parse this JSON data, do
//
//     final officeModel = officeModelFromJson(jsonString);

import 'dart:convert';

List<OfficeModel> officeModelFromJson(String str) => List<OfficeModel>.from(json.decode(str).map((x) => OfficeModel.fromJson(x)));

String officeModelToJson(List<OfficeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfficeModel {
    final int? id;
    final String? groupename;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    OfficeModel({
        this.id,
        this.groupename,
        this.createdAt,
        this.updatedAt,
    });

    factory OfficeModel.fromJson(Map<String, dynamic> json) => OfficeModel(
        id: json["id"],
        groupename: json["groupename"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "groupename": groupename,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
