// To parse this JSON data, do
//
//     final getCart = getCartFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';



class GetCart {
    GetCart({
        required this.message,
        required this.data,
    });

    final String message;
    final Data1 data;

    factory GetCart.fromJson(Map<String, dynamic> json) => GetCart(
        message: json["message"],
        data: Data1.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data1 {
    Data1({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.jobs,
    });

    final int id;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int userId;
    final List<Job> jobs;

    factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
    };
}

class Job {
  Job({
    required this.id,
    required this.role,
    required this.company,
    required this.logo,
    required this.location,
    required this.mode,
    required this.stipend,
    required this.duration,
    required this.about,
    required this.description,
    required this.link,
    required this.requirements,
    required this.skills,
    required this.perks,
    required this.createdAt,
    required this.updatedAt,
    required this.orderId,
    required this.cartjob,
  });

  final int id;
  final String role;
  final String company;
  final String logo;
  final String location;
  final String mode;
  final int stipend;
  final String duration;
  final String about;
  final String description;
  final String link;
  final String requirements;
  final String skills;
  final String perks;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic orderId;
  final Cartjob cartjob;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        role: json["role"],
        company: json["company"],
        logo: json["logo"],
        location: json["location"],
        mode: json["mode"],
        stipend: json["stipend"],
        duration: json["duration"],
        about: json["about"],
        description: json["description"],
        link: json["link"],
        requirements: json["requirements"],
        skills: json["skills"],
        perks: json["perks"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderId: json["orderId"],
        cartjob: Cartjob.fromJson(json["cartjob"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "company": company,
        "logo": logo,
        "location": location,
        "mode": mode,
        "stipend": stipend,
        "duration": duration,
        "about": about,
        "description": description,
        "link": link,
        "requirements": requirements,
        "skills": skills,
        "perks": perks,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "orderId": orderId,
        "cartjob": cartjob.toJson(),
      };
}

class Cartjob {
  Cartjob({
    required this.createdAt,
    required this.updatedAt,
    required this.cartId,
    required this.jobId,
  });

  final DateTime createdAt;
  final DateTime updatedAt;
  final int cartId;
  final int jobId;

  factory Cartjob.fromJson(Map<String, dynamic> json) => Cartjob(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cartId: json["cartId"],
        jobId: json["jobId"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "cartId": cartId,
        "jobId": jobId,
      };
}
