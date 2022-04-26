// ignore_for_file: prefer_collection_literals
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_hindu/article_detail.dart';
import 'package:the_hindu/lists/AllSportsView.dart';
import 'package:the_hindu/lists/banner_ads.dart';
import 'package:the_hindu/lists/full_image_view_item.dart';
import 'package:the_hindu/lists/full_width_article.dart';
import 'package:the_hindu/lists/home_page_list_item.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:the_hindu/lists/sport_star_item.dart';
import 'package:the_hindu/lists/subscribe_user.dart';
import 'package:the_hindu/lists/top_picks_item.dart';
import 'package:the_hindu/utils/AllSports.dart';
import 'package:the_hindu/utils/HomeData1.dart';
import 'package:the_hindu/utils/SportStars.dart';
import 'package:the_hindu/utils/top_picks.dart';

import '../utils/CustomColors.dart';

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
      child: loadHomeData(),
    );
  }

  Future<List<HomeData1>> fetchJsonData() async {
    final response =
        await rootBundle.rootBundle.loadString('assets/sample1.json');
    List? jsonResponse = json.decode(response);
    return jsonResponse!.map((e) => HomeData1.fromJson(e)).toList();
  }

  Widget loadHomeData() {
    return FutureBuilder(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          List<HomeData1>? data1 = snapshot.data as List<HomeData1>?;
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: data1?.length,
              itemBuilder: (BuildContext context, int index) {
                String? title = data1?[index].articalTitle;
                String? image = data1?[index].imageUrl;
                String? viewType = data1?[index].viewType;
                String? des = data1?[index].articleDes;
                if (viewType == "1") {
                  return ListTile(
                    title: FullImageViewItem(
                        articleTitle: title, articleImageUrl: image),
                    onTap: () => _sendDataToSecondScreen(context, des),
                  );
                } else if (viewType == "2") {
                  return ListTile(
                    title: HomePageListItem(
                      articleTitle: title,
                      articleImageUrl: image,
                    ),
                  );
                } else if (viewType == "3") {
                  return const BannerAds();
                } else if (viewType == "4") {
                  return const SubscribeUserTemplate();
                } else if (viewType == "5") {
                  List? data = data1![index].topPicks;
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    color: CustomColors.topPicksSection,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10,left: 10),
                              child: Text(
                                "Top Picks",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "FiraSans",
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                             Container(
                             margin: EdgeInsets.only(top: 10,right: 10),
                               child: Text(
                                 "View more",
                                 style: TextStyle(
                                     fontFamily: "FiraSans",
                                     fontSize: 16,
                                     color: Colors.lightBlue,
                                 fontWeight: FontWeight.w400),
                               ),
                             )
                          ],
                        ),
                        TopPicksView(
                          data: data?.map((e) => TopPicks.fromJson(e)).toList(),
                        ),
                      ],
                    ),
                  );
                } else if (viewType == "6") {
                  List? data = data1![index].sportStarsList;
                  return sportStarItem(
                    data: data?.map((e) => SportStars.fromJson(e)).toList(),
                  );
                } else if (viewType == "7") {
                  return FullWidthImageItem(
                    articleTitle: title,
                    articleImageUrl: image,
                  );
                } else if (viewType == "8") {
                  List? data = data1?[index].allSports;
                  return allSportsViewItem(
                      mapData: data?.map((e) => Welcome.fromJson(e)));
                }
                return const Center(
                  child: Text(""),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _sendDataToSecondScreen(BuildContext context, String? des) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleDetail(
            description: des,
          ),
        ));
  }
}
