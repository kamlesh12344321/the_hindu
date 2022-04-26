// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.data,
    this.status,
  });

  final List<Datum>? data;
  final bool? status;

  Welcome copyWith({
    List<Datum>? data,
    bool? status,
  }) =>
      Welcome(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class Datum {
  Datum({
    this.articleId,
    this.company,
    this.imgUrl,
    this.location,
    this.title,
    this.section,
    this.createdAt,
    this.description,
    this.sectionId,
  });

  final String? articleId;
  final Company? company;
  final String? imgUrl;
  final String? location;
  final String? title;
  final Section? section;
  final DateTime? createdAt;
  final String? description;
  final String? sectionId;

  Datum copyWith({
    String? articleId,
    Company? company,
    String? imgUrl,
    String? location,
    String? title,
    Section? section,
    DateTime? createdAt,
    String? description,
    String? sectionId,
  }) =>
      Datum(
        articleId: articleId ?? this.articleId,
        company: company ?? this.company,
        imgUrl: imgUrl ?? this.imgUrl,
        location: location ?? this.location,
        title: title ?? this.title,
        section: section ?? this.section,
        createdAt: createdAt ?? this.createdAt,
        description: description ?? this.description,
        sectionId: sectionId ?? this.sectionId,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    articleId: json["article_id"],
    company: companyValues.map?[json["company"]],
    imgUrl: json["img_url"] == null ? null : json["img_url"],
    location: json["location"],
    title: json["title"],
    section: sectionValues.map?[json["section"]],
    createdAt: DateTime.parse(json["created_at"]),
    description: json["description"],
    sectionId: json["section_id"],
  );

  Map<String, dynamic> toJson() => {
    "article_id": articleId,
    "company": companyValues.reverse?[company],
    "img_url": imgUrl,
    "location": location,
    "title": title,
    "section": sectionValues.reverse?[section],
    "created_at": createdAt?.toIso8601String(),
    "description": description,
    "section_id": sectionId,
  };
}

enum Company { THE_HINDU }

final companyValues = EnumValues({
  "The Hindu": Company.THE_HINDU
});

enum Section { ENTERTAINMENT, MARKETS }

final sectionValues = EnumValues({
  "Entertainment": Section.ENTERTAINMENT,
  "Markets": Section.MARKETS
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
