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
import 'package:the_hindu/networking/models/generic_data.dart';
import 'package:the_hindu/networking/models/section_list.dart';
import 'package:the_hindu/networking/models/sport_stars.dart';
import 'package:the_hindu/networking/view_models/Article_list_view_model.dart';
import 'package:the_hindu/networking/view_models/generic_list_view_model.dart';
import 'package:the_hindu/networking/view_models/sport_stars_view_model.dart';
import 'package:the_hindu/widgets/custom_tab_view.dart';
import '../networking/view_models/sections_list_view_model.dart';
import '../utils/CustomColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  late SectionsViewModel viewModel;
  late ArticleListViewModel articleListViewModel;
  late Sections? data;
  late HomeArticle? homeArticleData;
  List<Article> topPicksList = [];
  late SportStarsViewModel sportStarsViewModel;
  late GenericViewModel genericViewModel;
  late SportStars? sportStarsList;
  late int _pageIndex = 0;
  late PageController _pageController;
  int initPosition = 0;

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<SectionsViewModel>();
    articleListViewModel = context.watch<ArticleListViewModel>();
    data = viewModel.sectionList;
    Section homeSection = Section();
    homeSection.sectionId = "1000";
    homeSection.name = "Home";
    homeSection.subSections = [];
    if (data?.data?[0].name != "Home") {
      data?.data?.insert(0, homeSection);
    }
    homeArticleData = articleListViewModel.homeArticles;
    sportStarsViewModel = context.watch<SportStarsViewModel>();
    sportStarsList = sportStarsViewModel.sportStars;
    String selectedReport = '';

    return SafeArea(
      child: CustomTabView(
        initPosition: initPosition,
        itemCount: data?.data?.length,
        tabBuilder: (context, index) => Tab(text: data?.data?[index].name),
        pageBuilder: (context, index) {
          if (index == 0) {
            return Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: homeArticleData?.data?.length,
                itemBuilder: (context, index) {
                  Article? ar = homeArticleData?.data?[index];
                  if (topPicksList.length < 5) {
                    if(ar != null){
                      topPicksList.add(ar);
                    }

                  }
                  if (index == 0) {
                    return InkWell(
                      onTap: (){
                        _sendDataToSecondScreen(context,ar?.description);
                      },
                      child: FullImageViewItem(article: ar,),
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
                                child: const Text(
                                  "Top Picks",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "FiraSans",
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, right: 10),
                                child: const Text(
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
                    return ListTile(
                      title: FullWidthImageItem(
                        articleImageUrl: ar?.imgUrl,
                        articleTitle: ar?.title,
                      ),
                      onTap: (){
                        _sendDataToSecondScreen(context, ar?.description);
                      },
                    );
                  } else if (index + 1 == homeArticleData?.data?.length) {
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
                  return ListTile(
                    title:  HomePageListItem(
                      articleTitle: ar?.title,
                      articleImageUrl: ar?.imgUrl,
                    ),
                    onTap: (){
                      _sendDataToSecondScreen(context, ar?.description);
                    },
                  );
                },
              ),
            );
          } else {

            return Container(
              child: Center(
                child: Text("Coming soon",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),),
              ),
            );
          }
        },
        onPositionChange: (index) {
          print('current position: $index');
          initPosition = index;
        },
        onScroll: (position) => print('$position'),
      ),
    );
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
            .toList(),);
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
