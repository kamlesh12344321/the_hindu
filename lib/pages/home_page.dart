// ignore_for_file: prefer_collection_literals
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:the_hindu/article_detail.dart';
import 'package:the_hindu/lists/banner_ads.dart';
import 'package:the_hindu/lists/full_image_view_item.dart';
import 'package:the_hindu/lists/full_width_article.dart';
import 'package:the_hindu/lists/home_page_list_item.dart';
import 'package:the_hindu/lists/sport_star_item.dart';
import 'package:the_hindu/lists/subscribe_user.dart';
import 'package:the_hindu/lists/top_picks_item.dart';
import 'package:the_hindu/networking/models/article_list.dart';
import 'package:the_hindu/networking/models/section_list.dart';
import 'package:the_hindu/networking/models/sport_stars.dart';
import 'package:the_hindu/networking/view_models/Article_list_view_model.dart';
import 'package:the_hindu/networking/view_models/sport_stars_view_model.dart';
import '../networking/view_models/sections_list_view_model.dart';
import '../utils/CustomColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // futureData = fetchJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SectionsViewModel viewModel = context.watch<SectionsViewModel>();
    ArticleListViewModel articleListViewModel =
        context.watch<ArticleListViewModel>();
    Sections? data = _ui(viewModel);
    Section homeSection = Section();
    homeSection.sectionId = "1000";
    homeSection.name = "Home";
    homeSection.subSections = [];
    if (data?.data?[0].name != "Home") {
      data?.data?.insert(0, homeSection);
    }
    HomeArticle? homeArticleData = _uiArticles(articleListViewModel);
    List<Article> topPicksList = [];
    SportStarsViewModel sportStarsViewModel =
        context.watch<SportStarsViewModel>();
    SportStars? sportStarsList = _uiSportStars(sportStarsViewModel);
    print(sportStarsList);
    String selectedReport = '';
    return Column(
      children: [
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data?.data?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  data?.data?[index].name ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "FiraSans"),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: homeArticleData?.data?.length,
              itemBuilder: (context, index) {
                Article ar = homeArticleData!.data![index];
                if (topPicksList.length < 5) {
                  topPicksList.add(ar);
                }
                if (index == 0) {
                  return FullImageViewItem(
                    articleImageUrl: ar.imgUrl,
                    articleTitle: ar.title,
                  );
                } else if (index == 3) {
                  return BannerAds();
                } else if (index == 6) {
                  return SubscribeUserTemplate();
                } else if (index == 10) {
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
                              margin: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                "Top Picks",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "FiraSans",
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 10),
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
                        TopPicksView(data: topPicksList),
                      ],
                    ),
                  );
                } else if (index == 13) {
                  return sportStarItem(
                    data: sportStarsList?.data,
                  );
                } else if (index == 16) {
                  return FullWidthImageItem(
                    articleImageUrl: ar.imgUrl,
                    articleTitle: ar.title,
                  );
                } else if (index + 1 == homeArticleData.data?.length) {
                  List<SubSection> sportsChipList =
                      _getSportChipsList(viewModel);
                  print(sportsChipList);
                  return Column(
                    children: [
                      SingleChildScrollView(
                        child: SingleSelectChip(
                            reportList: sportsChipList,
                            onSelectionChanged: (selectedItem) {
                              setState(() {
                                selectedReport = selectedItem;
                              });
                            }),
                      )
                    ],
                  );
                }
                return HomePageListItem(
                  articleTitle: ar.title,
                  articleImageUrl: ar.imgUrl,
                );
              },
            ),
          ),
        )
      ],
    );
  }

  _ui(SectionsViewModel? viewModel) {
    return viewModel?.sectionList;
  }

  _uiArticles(ArticleListViewModel? viewModel) {
    return viewModel?.homeArticles;
  }

  _uiSportStars(SportStarsViewModel? viewModel) {
    return viewModel?.sportStars;
  }

  _getSportChipsList(SectionsViewModel? sectionsViewModel) {
    Sections? sections = sectionsViewModel?.sectionList;
    List<Section>? sectionList = sections?.data;
    if (sectionList!.isNotEmpty) {
      for (Section section in sectionList) {
        if (section.subSections!.isNotEmpty) {
          return section.subSections;
        }
      }
    }
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

class SingleSelectChip extends StatefulWidget {
  final List<SubSection>? reportList;
  final Function onSelectionChanged;

  SingleSelectChip(
      {required this.reportList, required this.onSelectionChanged});

  @override
  _SingleSelectChipState createState() => _SingleSelectChipState();
}

class _SingleSelectChipState extends State<SingleSelectChip> {
  String selectedChoices = '';

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: widget.reportList!
            .map((item) => (Container(
                  padding: const EdgeInsets.all(2.0),
                  child: ChoiceChip(
                    selectedColor: Colors.lightBlueAccent,
                    label: Text(item.name ?? ""),
                    selected: selectedChoices.contains(item.sectionId ?? ""),
                    onSelected: (selected) {
                      setState(() {
                        selectedChoices = item.sectionId ?? "";
                      });
                    },
                  ),
                )))
            .toList());
  }
}

_pageViewBuilder(Sections sections) {
  PageController pageController = PageController();
  PageView.builder(
      scrollDirection: Axis.horizontal,
      pageSnapping: false,
      itemCount: sections.data?.length,
      controller: pageController,
      itemBuilder: (context, index) {
       return Container();
      });
}
