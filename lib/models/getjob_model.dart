class GetJob {
  GetJob({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<Data> data;

  GetJob.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
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
    this.orderId,
  });
  late final int id;
  late final String role;
  late final String company;
  late final String logo;
  late final String location;
  late final String mode;
  late final int stipend;
  late final String duration;
  late final String about;
  late final String description;
  late final String link;
  String? requirements;
  late final String skills;
  late final String perks;
  late final String createdAt;
  late final String updatedAt;
  late final Null orderId;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    company = json['company'];
    logo = json['logo'];
    location = json['location'];
    mode = json['mode'];
    stipend = json['stipend'];
    duration = json['duration'];
    about = json['about'];
    description = json['description'];
    link = json['link'];
    requirements = json['requirements'];
    skills = json['skills'];
    perks = json['perks'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['role'] = role;
    _data['company'] = company;
    _data['logo'] = logo;
    _data['location'] = location;
    _data['mode'] = mode;
    _data['stipend'] = stipend;
    _data['duration'] = duration;
    _data['about'] = about;
    _data['description'] = description;
    _data['link'] = link;
    _data['requirements'] = requirements;
    _data['skills'] = skills;
    _data['perks'] = perks;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['orderId'] = orderId;
    return _data;
  }
}
