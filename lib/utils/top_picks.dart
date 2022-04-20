import 'dart:convert';
/// imageUrl : "https://www.thehindu.com/incoming/42m2i3/article65320454.ece/alternates/LANDSCAPE_660/KGF%20%286%29.jpg"
/// title : "‘K.G.F: Chapter 2’ movie review: Yash and Prashanth Neel’s film is an unabashed celebration of hyper-masculinity"
/// des : ""

TopPicks topPicksFromJson(String str) => TopPicks.fromJson(json.decode(str));
String topPicksToJson(TopPicks data) => json.encode(data.toJson());
class TopPicks {
  TopPicks({
      String? imageUrl, 
      String? title, 
      String? des,}){
    _imageUrl = imageUrl;
    _title = title;
    _des = des;
}

  TopPicks.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _title = json['title'];
    _des = json['des'];
  }
  String? _imageUrl;
  String? _title;
  String? _des;
TopPicks copyWith({  String? imageUrl,
  String? title,
  String? des,
}) => TopPicks(  imageUrl: imageUrl ?? _imageUrl,
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