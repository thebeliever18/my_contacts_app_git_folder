// class ContactModel{
//   final String? position;
//   final String? name;
//   final String? officeName;
//   final String? mobileNumber;
//   final String? officeNumber;
//   final String? emailAddress;

//   const ContactModel({
//     this.position,
//     this.name,
//     this.officeName,
//     this.mobileNumber,
//     this.officeNumber,
//     this.emailAddress
//   });
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ContactModel> contactFromJson(String str) => List<ContactModel>.from(json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactToJson(List<ContactModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactModel {
    ContactModel({
        this.id,
        this.groupId,
        this.name,
        this.company,
        this.email,
        this.phone,
        this.address,
        this.photo,
        this.facebook,
        this.twitter,
        this.notes,
        this.customfields,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    int? groupId;
    String? name;
    String? company;
    String? email;
    String? phone;
    String? address;
    dynamic photo;
    dynamic facebook;
    dynamic twitter;
    String? notes;
    String? customfields;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        groupId: json["group_id"],
        name: json["name"],
        company: json["company"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        photo: json["photo"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        notes: json["notes"] == null ? null : json["notes"],
        customfields: json["customfields"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "group_id": groupId,
        "name": name,
        "company": company,
        "email": email,
        "phone": phone,
        "address": address,
        "photo": photo,
        "facebook": facebook,
        "twitter": twitter,
        "notes": notes == null ? null : notes,
        "customfields": customfields,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
