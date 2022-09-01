// To parse this JSON data, do
//
//     final filterContactModel = filterContactModelFromJson(jsonString);

import 'dart:convert';

List<FilterContactModel> filterContactModelFromJson(String str) => List<FilterContactModel>.from(json.decode(str).map((x) => FilterContactModel.fromJson(x)));

String filterContactModelToJson(List<FilterContactModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterContactModel {
    

    final int? id;
    final int? groupId;
    final int? deptId;
    final String? name;
    final String? company;
    final String? email;
    final String? phone;
    final String? address;
    final int? province;
    final int? distId;
    final String? photo;
    final dynamic facebook;
    final dynamic twitter;
    final String? notes;
    final String? customfields;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    
    FilterContactModel({
        this.id,
        this.groupId,
        this.deptId,
        this.name,
        this.company,
        this.email,
        this.phone,
        this.address,
        this.province,
        this.distId,
        this.photo,
        this.facebook,
        this.twitter,
        this.notes,
        this.customfields,
        this.createdAt,
        this.updatedAt,
    });

    factory FilterContactModel.fromJson(Map<String, dynamic> json) => FilterContactModel(
        id: json["id"],
        groupId: json["group_id"],
        deptId: json["dept_id"],
        name: json["name"],
        company: json["company"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        province: json["province"],
        distId: json["dist_id"],
        photo: json["photo"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        notes: json["notes"],
        customfields: json["customfields"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "group_id": groupId,
        "dept_id": deptId,
        "name": name,
        "company": company,
        "email": email,
        "phone": phone,
        "address": address,
        "province": province,
        "dist_id": distId,
        "photo": photo,
        "facebook": facebook,
        "twitter": twitter,
        "notes": notes,
        "customfields": customfields,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
