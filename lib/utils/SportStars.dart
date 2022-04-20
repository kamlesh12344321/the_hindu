import 'dart:convert';
/// imageUrl : "https://www.thehindu.com/incoming/jgmqx5/article65331194.ece/alternates/LANDSCAPE_660/1239417462.jpg"
/// title : "Judge rules Musk’s tweets over taking Tesla private were false, investors say"
/// des : "Judge rules Musk’s tweets over taking Tesla private were false, investors say"

SportStars sportStarsFromJson(String str) => SportStars.fromJson(json.decode(str));
String sportStarsToJson(SportStars data) => json.encode(data.toJson());
class SportStars {
  SportStars({
      String? imageUrl, 
      String? title, 
      String? des,}){
    _imageUrl = imageUrl;
    _title = title;
    _des = des;
}

  SportStars.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _title = json['title'];
    _des = json['des'];
  }
  String? _imageUrl;
  String? _title;
  String? _des;
SportStars copyWith({  String? imageUrl,
  String? title,
  String? des,
}) => SportStars(  imageUrl: imageUrl ?? _imageUrl,
  title: title ?? _title,
  des: des ?? _des,
);
  String? get imageUrl => _imageUrl;
  String? get title => _title;
  String? get des => _des;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    map['title'] = _title;
    map['des'] = _des;
    return map;
  }

}