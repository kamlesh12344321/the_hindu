import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.viewType,
    this.articalTitle,
    this.isLive,
    this.country,
    this.time,
    this.isFavrate,
    this.articleDes,
    this.imageUrl,
    this.addVisibility,
    this.crownIconVisibility,
    this.isSubscribeUser,
    this.allSports,
  });

  final String? viewType;
  final String? articalTitle;
  final bool? isLive;
  final String? country;
  final String? time;
  final bool? isFavrate;
  final String? articleDes;
  final String? imageUrl;
  final bool? addVisibility;
  final bool? crownIconVisibility;
  final bool? isSubscribeUser;
  final List<AllSport>? allSports;

  Welcome copyWith({
    String? viewType,
    String? articalTitle,
    bool? isLive,
    String? country,
    String? time,
    bool? isFavrate,
    String? articleDes,
    String? imageUrl,
    bool? addVisibility,
    bool? crownIconVisibility,
    bool? isSubscribeUser,
    List<AllSport>? allSports,
  }) =>
      Welcome(
        viewType: viewType ?? this.viewType,
        articalTitle: articalTitle ?? this.articalTitle,
        isLive: isLive ?? this.isLive,
        country: country ?? this.country,
        time: time ?? this.time,
        isFavrate: isFavrate ?? this.isFavrate,
        articleDes: articleDes ?? this.articleDes,
        imageUrl: imageUrl ?? this.imageUrl,
        addVisibility: addVisibility ?? this.addVisibility,
        crownIconVisibility: crownIconVisibility ?? this.crownIconVisibility,
        isSubscribeUser: isSubscribeUser ?? this.isSubscribeUser,
        allSports: allSports ?? this.allSports,
      );

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    viewType: json["viewType"] == null ? null : json["viewType"],
    articalTitle: json["artical_title"] == null ? null : json["artical_title"],
    isLive: json["is_live"] == null ? null : json["is_live"],
    country: json["country"] == null ? null : json["country"],
    time: json["time"] == null ? null : json["time"],
    isFavrate: json["isFavrate"] == null ? null : json["isFavrate"],
    articleDes: json["articleDes"] == null ? null : json["articleDes"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    addVisibility: json["addVisibility"] == null ? null : json["addVisibility"],
    crownIconVisibility: json["crownIconVisibility"] == null ? null : json["crownIconVisibility"],
    isSubscribeUser: json["isSubscribeUser"] == null ? null : json["isSubscribeUser"],
    allSports: json["allSports"] == null ? null : List<AllSport>.from(json["allSports"].map((x) => AllSport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "viewType": viewType == null ? null : viewType,
    "artical_title": articalTitle == null ? null : articalTitle,
    "is_live": isLive == null ? null : isLive,
    "country": country == null ? null : country,
    "time": time == null ? null : time,
    "isFavrate": isFavrate == null ? null : isFavrate,
    "articleDes": articleDes == null ? null : articleDes,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "addVisibility": addVisibility == null ? null : addVisibility,
    "crownIconVisibility": crownIconVisibility == null ? null : crownIconVisibility,
    "isSubscribeUser": isSubscribeUser == null ? null : isSubscribeUser,
    "allSports": allSports == null ? null : List<dynamic>.from(allSports!.map((x) => x.toJson())),
  };
}

class AllSport {
  AllSport({
    this.cricket,
    this.football,
    this.hockey,
    this.tennis,
    this.athletics,
    this.motorsport,
    this.others,
  });

  final List<Athletics>? cricket;
  final List<Athletics>? football;
  final List<Athletics>? hockey;
  final List<Athletics>? tennis;
  final List<Athletics>? athletics;
  final List<Athletics>? motorsport;
  final List<Athletics>? others;

  AllSport copyWith({
    List<Athletics>? cricket,
    List<Athletics>? football,
    List<Athletics>? hockey,
    List<Athletics>? tennis,
    List<Athletics>? athletics,
    List<Athletics>? motorsport,
    List<Athletics>? others,
  }) =>
      AllSport(
        cricket: cricket ?? this.cricket,
        football: football ?? this.football,
        hockey: hockey ?? this.hockey,
        tennis: tennis ?? this.tennis,
        athletics: athletics ?? this.athletics,
        motorsport: motorsport ?? this.motorsport,
        others: others ?? this.others,
      );

  factory AllSport.fromJson(Map<String, dynamic> json) => AllSport(
    cricket: json["Cricket"] == null ? null : List<Athletics>.from(json["Cricket"].map((x) => Athletics.fromJson(x))),
    football: json["Football"] == null ? null : List<Athletics>.from(json["Football"].map((x) => Athletics.fromJson(x))),
    hockey: json["Hockey"] == null ? null : List<Athletics>.from(json["Hockey"].map((x) => Athletics.fromJson(x))),
    tennis: json["Tennis"] == null ? null : List<Athletics>.from(json["Tennis"].map((x) => Athletics.fromJson(x))),
    athletics: json["Athletics"] == null ? null : List<Athletics>.from(json["Athletics"].map((x) => Athletics.fromJson(x))),
    motorsport: json["Motorsport"] == null ? null : List<Athletics>.from(json["Motorsport"].map((x) => Athletics.fromJson(x))),
    others: json["Others"] == null ? null : List<Athletics>.from(json["Others"].map((x) => Athletics.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Cricket": cricket == null ? null : List<dynamic>.from(cricket!.map((x) => x.toJson())),
    "Football": football == null ? null : List<dynamic>.from(football!.map((x) => x.toJson())),
    "Hockey": hockey == null ? null : List<dynamic>.from(hockey!.map((x) => x.toJson())),
    "Tennis": tennis == null ? null : List<dynamic>.from(tennis!.map((x) => x.toJson())),
    "Athletics": athletics == null ? null : List<dynamic>.from(athletics!.map((x) => x.toJson())),
    "Motorsport": motorsport == null ? null : List<dynamic>.from(motorsport!.map((x) => x.toJson())),
    "Others": others == null ? null : List<dynamic>.from(others!.map((x) => x.toJson())),
  };
}

class Athletics {
  Athletics({
    this.imageUrl,
    this.title,
    this.des,
  });

  final String? imageUrl;
  final String? title;
  final String? des;

  Athletics copyWith({
    String? imageUrl,
    String? title,
    String? des,
  }) =>
      Athletics(
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        des: des ?? this.des,
      );

  factory Athletics.fromJson(Map<String, dynamic> json) => Athletics(
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    title: json["title"] == null ? null : json["title"],
    des: json["des"] == null ? null : json["des"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl == null ? null : imageUrl,
    "title": title == null ? null : title,
    "des": des == null ? null : des,
  };
}
