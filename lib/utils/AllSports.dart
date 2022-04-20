import 'dart:convert';
/// Cricket : [{"imageUrl":"https://www.thehindu.com/incoming/m3tl3v/article65330202.ece/alternates/FREE_1200/PTI04_17_2022_000228B.jpg","title":"IPL 2022 | Gujarat Titans beat CSK by three wickets","des":"Gujarat Titans defeated Chennai Super Kings by three wickets on Sunday.\n\nDavid Miller smashed an unbeaten 51-ball 94, while stand-in skipper Rashid Khan slammed a 21-ball 40 as GT chased down the total with one ball to spare."},{"imageUrl":"https://www.thehindu.com/sport/cricket/2sy23n/article65328988.ece/alternates/FREE_1200/PTI04_15_2022_000245A.jpg","title":"IPL 2022: RR vs KKR | Kolkata seeks to bounce back against Rajasthan after back-to-back losses","des":"Their confidence severely dented after two comprehensive defeats on the trot, last edition's runner-up side Kolkata Knight Riders would seek to get their inconsistent campaign back on track when they face Rajasthan Royals in an IPL match in Mumbai on Monday.\n\nKKR were beaten by Delhi Capitals and Sunrisers Hyderabad by 44 runs and seven wickets respectively in their last two matches. They had earlier lost to Royal Challengers Bangalore."},{"imageUrl":"https://www.thehindu.com/incoming/udz71p/article65330146.ece/alternates/FREE_1200/IMG_India_Test_Headshots_2_1_UG9H10L8.jpg","title":"Pujara hits double ton in second innings on Sussex debut","des":"Senior India batter Cheteshwar Pujara redeemed himself with an unbeaten double hundred in the second innings as Sussex snatched a draw against Derbyshire at the 2022 County Championship here on Sunday.\n\nMaking his debut for Sussex, Pujara was dismissed for six off 15 balls in his first innings on the second day as his team folded for 174 in 56.3 overs in reply to Derbyshire's 505."},{"imageUrl":"https://www.thehindu.com/incoming/ofhw52/article65329570.ece/alternates/SQUARE_115/PTI04_17_2022_000148A.jpg","title":"IPL 2022: PBKS vs SRH | Malik, Bhuvneshwar make it four in a row for Sunrisers","des":"Mayank Agarwal was missing, having hurt his toe on Satuday. The Punjab Kings, with Shikhar Dhawan at the helm, missed its skipper badly as the in-form Sunrisers Hyderabad pace quartet was all over it to set up a fourth consecutive win in the Indian Premier League’s 15th edition."},{"imageUrl":"https://www.thehindu.com/news/international/m0kstc/article65327448.ece/alternates/SQUARE_115/DK.jpg","title":"IPL 2022 | RCB defeat Delhi Capitals by 16 runs","des":"Dinesh Karthik batted with authority in his unbeaten 34-ball 66 before the bowlers staged a fine comeback as Royal Challengers Bangalore defeated Delhi Capitals by 16 runs in the Indian Premier League here on Saturday."},{"imageUrl":"https://www.thehindu.com/todays-paper/tp-sports/pynzxn/article65325420.ece/alternates/SQUARE_115/TH16-LEAD-SRH-K%2BGI19N8OA2.3.jpg.jpg","title":"Sunrisers pacers breathe fire before Tripathi-Markram seal the deal.","des":"Nitish Rana and Andre Russell fired in the latter half of the innings to take Kolkata Knight Riders to a respectable total. But Rahul Tripathi and Aiden Markram masterminded the chase as Sunrisers Hyderabad registered a hat-trick of wins in IPL-2022 at the Brabourne Stadium on Friday."}]

AllSports allSportsFromJson(String str) => AllSports.fromJson(json.decode(str));
String allSportsToJson(AllSports data) => json.encode(data.toJson());
class AllSports {
  AllSports({
      List<Cricket>? cricket,}){
    _cricket = cricket;
}

  AllSports.fromJson(dynamic json) {
    if (json['Cricket'] != null) {
      _cricket = [];
      json['Cricket'].forEach((v) {
        _cricket?.add(Cricket.fromJson(v));
      });
    }
  }
  List<Cricket>? _cricket;
AllSports copyWith({  List<Cricket>? cricket,
}) => AllSports(  cricket: cricket ?? _cricket,
);
  List<Cricket>? get cricket => _cricket;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cricket != null) {
      map['Cricket'] = _cricket?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// imageUrl : "https://www.thehindu.com/incoming/m3tl3v/article65330202.ece/alternates/FREE_1200/PTI04_17_2022_000228B.jpg"
/// title : "IPL 2022 | Gujarat Titans beat CSK by three wickets"
/// des : "Gujarat Titans defeated Chennai Super Kings by three wickets on Sunday.\n\nDavid Miller smashed an unbeaten 51-ball 94, while stand-in skipper Rashid Khan slammed a 21-ball 40 as GT chased down the total with one ball to spare."

Cricket cricketFromJson(String str) => Cricket.fromJson(json.decode(str));
String cricketToJson(Cricket data) => json.encode(data.toJson());
class Cricket {
  Cricket({
      String? imageUrl, 
      String? title, 
      String? des,}){
    _imageUrl = imageUrl;
    _title = title;
    _des = des;
}

  Cricket.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _title = json['title'];
    _des = json['des'];
  }
  String? _imageUrl;
  String? _title;
  String? _des;
Cricket copyWith({  String? imageUrl,
  String? title,
  String? des,
}) => Cricket(  imageUrl: imageUrl ?? _imageUrl,
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