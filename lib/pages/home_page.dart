// ignore_for_file: prefer_collection_literals
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_hindu/lists/banner_ads.dart';
import 'package:the_hindu/lists/full_image_view_item.dart';
import 'package:the_hindu/lists/home_page_list_item.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:the_hindu/lists/sport_star_item.dart';
import 'package:the_hindu/lists/subscribe_user.dart';
import 'package:the_hindu/lists/top_picks_item.dart';
import 'package:the_hindu/utils/HomeData1.dart';
import 'package:the_hindu/utils/SportStars.dart';
import 'package:the_hindu/utils/top_picks.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<HomeData1>> futureData;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureData = fetchJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<HomeData1>? data1 = snapshot.data as List<HomeData1>?;
            return ListView.builder(
                itemCount: data1?.length,
                itemBuilder: (BuildContext context, int index) {
                  String? title = data1?[index].articalTitle;
                  String? image = data1?[index].imageUrl;
                  String? viewType = data1?[index].viewType;
                  if (viewType == "1") {
                    return FullImageViewItem(
                        articleTitle: title, articleImageUrl: image);
                  } else if (viewType == "2") {
                    return HomePageListItem(
                      articleTitle: title,
                      articleImageUrl: image,
                    );
                  } else if (viewType == "3") {
                    return BannerAds();
                  } else if (viewType == "4") {
                    return SubscribeUserTemplate();
                  }
                  else if(viewType == "5"){
                   List? data = data1![index].topPicks;
                   return TopPicksView(data:  data?.map((e) => TopPicks.fromJson(e)).toList(),);
                  } else if(viewType == "6"){
                    List? data = data1![index].sportStarsList;
                    // return SportStarItem(data : data?.map((e) => SportStars.fromJson(e)).toList(),);
                  }
                  return Center(
                    child: Text(""),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<HomeData1>> fetchJsonData() async {
    final response =
        await rootBundle.rootBundle.loadString('assets/sample1.json');
    List? jsonResponse = json.decode(response);
    return jsonResponse!.map((e) => HomeData1.fromJson(e)).toList();
  }
}
