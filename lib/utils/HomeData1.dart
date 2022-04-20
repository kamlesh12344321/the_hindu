import 'dart:convert';
/// viewType : "1"
/// artical_title : "Lakhimpur Kheri violence case | Supreme Court sets aside Allahabad HC order granting bail to Ashish Mishra"
/// is_live : false
/// country : "India"
/// time : "12 PM"
/// isFavrate : false
/// articleDes : "The Supreme Court on Monday cancelled the bail granted by Allahabad High Court to Ashish Mishra, Lakhimpur Kheri case prime accused and a Union Minister's son, in a \"tearing hurry\" and without giving the victims of the crime an opportunity to be heard.\n\nA three-judge Bench of Chief Justice of India N.V. Ramana, Justices Surya Kant and Hima Kohli directed him to surrender within a week.\n\nThe order, read out in court by Justice Kant for the Bench, said the High Court exceeded its jurisdiction, denied victims a chance to participate in the bail proceedings and was in a \"tearing hurry\" to grant bail. He said the court, taking all these factors under consideration, could \"rightfully cancel the bail\"."
/// imageUrl : "https://www.thehindu.com/incoming/3oh9z3/article65331260.ece/alternates/FREE_1200/IMG_Ashish_Mishra_at_Cri_2_1_G692L6JA.jpg"
/// addVisibility : false
/// crownIconVisibility : false
/// isSubscribeUser : false

HomeData1 homeData1FromJson(String str) => HomeData1.fromJson(json.decode(str));
String homeData1ToJson(HomeData1 data) => json.encode(data.toJson());
class HomeData1 {
  HomeData1({
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
      List<dynamic>? topPicks,
      List<dynamic>? sportStars,
      // Map<dynamic,dynamic>? allSports,
  }){
    _viewType = viewType;
    _articalTitle = articalTitle;
    _isLive = isLive;
    _country = country;
    _time = time;
    _isFavrate = isFavrate;
    _articleDes = articleDes;
    _imageUrl = imageUrl;
    _addVisibility = addVisibility;
    _crownIconVisibility = crownIconVisibility;
    _isSubscribeUser = isSubscribeUser;
    _topPicksList = topPicks;
    _sportStarsList = sportStars;
    // _allSports = allSports;
}

  HomeData1.fromJson(dynamic json) {
    _viewType = json['viewType'];
    _articalTitle = json['artical_title'];
    _isLive = json['is_live'];
    _country = json['country'];
    _time = json['time'];
    _isFavrate = json['isFavrate'];
    _articleDes = json['articleDes'];
    _imageUrl = json['imageUrl'];
    _addVisibility = json['addVisibility'];
    _crownIconVisibility = json['crownIconVisibility'];
    _isSubscribeUser = json['isSubscribeUser'];
    _topPicksList = json["topPicks"];
    _sportStarsList = json["sportStars"];
    // _allSports = json["allSports"];
  }
  String? _viewType;
  String? _articalTitle;
  bool? _isLive;
  String? _country;
  String? _time;
  bool? _isFavrate;
  String? _articleDes;
  String? _imageUrl;
  bool? _addVisibility;
  bool? _crownIconVisibility;
  bool? _isSubscribeUser;
  List<dynamic>? _topPicksList;
  List<dynamic>? _sportStarsList;
  // Map<dynamic,dynamic>? _allSports;
HomeData1 copyWith({  String? viewType,
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
  List<dynamic>? topPicks,
  List<dynamic>? sportStarsList,
  // Map<dynamic,dynamic>? allSports,
}) => HomeData1(  viewType: viewType ?? _viewType,
  articalTitle: articalTitle ?? _articalTitle,
  isLive: isLive ?? _isLive,
  country: country ?? _country,
  time: time ?? _time,
  isFavrate: isFavrate ?? _isFavrate,
  articleDes: articleDes ?? _articleDes,
  imageUrl: imageUrl ?? _imageUrl,
  addVisibility: addVisibility ?? _addVisibility,
  crownIconVisibility: crownIconVisibility ?? _crownIconVisibility,
  isSubscribeUser: isSubscribeUser ?? _isSubscribeUser,
  topPicks: topPicks ?? _topPicksList,
  sportStars: sportStarsList ?? _sportStarsList,
  // allSports: allSports ?? _allSports,
);
  String? get viewType => _viewType;
  String? get articalTitle => _articalTitle;
  bool? get isLive => _isLive;
  String? get country => _country;
  String? get time => _time;
  bool? get isFavrate => _isFavrate;
  String? get articleDes => _articleDes;
  String? get imageUrl => _imageUrl;
  bool? get addVisibility => _addVisibility;
  bool? get crownIconVisibility => _crownIconVisibility;
  bool? get isSubscribeUser => _isSubscribeUser;
  List<dynamic>? get topPicks => _topPicksList;
  List<dynamic>? get sportStarsList => _sportStarsList;
  // Map<dynamic,dynamic>? get allSports => _allSports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['viewType'] = _viewType;
    map['artical_title'] = _articalTitle;
    map['is_live'] = _isLive;
    map['country'] = _country;
    map['time'] = _time;
    map['isFavrate'] = _isFavrate;
    map['articleDes'] = _articleDes;
    map['imageUrl'] = _imageUrl;
    map['addVisibility'] = _addVisibility;
    map['crownIconVisibility'] = _crownIconVisibility;
    map['isSubscribeUser'] = _isSubscribeUser;
    map['topPicks'] = _topPicksList;
    map['sportStars'] = _sportStarsList;
    // map['allSports'] = _allSports;
    return map;
  }
}