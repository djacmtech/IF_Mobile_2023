class Summary {
  Summary({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  Summary.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.jobs,
    required this.credits,
    required this.totalPrice,
    required this.discount,
  });
  late final List<Jobs>? jobs;
  late final int? credits;
  late final int? totalPrice;
  late final int? discount;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['jobs'] == null) {
      jobs = null;
    } else {
      jobs = List.from(json['jobs']).map((e) => Jobs.fromJson(e)).toList();
    }

    credits = json['credits'];
    totalPrice = json['totalPrice'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (jobs == null) {
      _data['jobs'] = null;
    } else {
      _data['jobs'] = jobs!.map((e) => e.toJson()).toList();
    }

    _data['credits'] = credits;
    _data['totalPrice'] = totalPrice;
    _data['discount'] = discount;
    return _data;
  }
}

class Jobs {
  Jobs({
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
    this.requirements,
    required this.skills,
    required this.perks,
    required this.createdAt,
    required this.updatedAt,
    this.orderId,
    // required this.cartjob,
  });
  late final int? id;
  late final String? role;
  late final String? company;
  late final String? logo;
  late final String? location;
  late final String? mode;
  late final int? stipend;
  late final String? duration;
  late final String? about;
  late final String? description;
  late final String? link;
  late final String? requirements;
  late final String? skills;
  late final String? perks;
  late final String? createdAt;
  late final String? updatedAt;
  late final Null? orderId;
  // late final Cartjob cartjob;

  Jobs.fromJson(Map<String, dynamic> json) {
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
    requirements = null;
    skills = json['skills'];
    perks = json['perks'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderId = null;
    // cartjob = Cartjob.fromJson(json['cartjob']);
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
    // _data['cartjob'] = cartjob?.toJson();
    return _data;
  }
}

class Cartjob {
  Cartjob({
    required this.createdAt,
    required this.updatedAt,
    required this.cartId,
    required this.jobId,
  });
  late final String createdAt;
  late final String updatedAt;
  late final int cartId;
  late final int jobId;

  Cartjob.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cartId = json['cartId'];
    jobId = json['jobId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['cartId'] = cartId;
    _data['jobId'] = jobId;
    return _data;
  }
}
