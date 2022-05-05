import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_hindu/networking/models/generic_data.dart';
import 'package:the_hindu/networking/view_models/generic_list_view_model.dart';

import '../networking/models/section_list.dart';
import '../widgets/big_text.dart';
import '../widgets/small_icon_article.dart';
import '../widgets/small_text.dart';

class AllSportsViewItem extends StatefulWidget {
  late List<SubSection> sportSectionData;

  AllSportsViewItem(this.sportSectionData, {Key? key}) : super(key: key);

  @override
  State<AllSportsViewItem> createState() => _AllSportsViewItemState();
}

class _AllSportsViewItemState extends State<AllSportsViewItem> {
  late GenericViewModel genericViewModel;
  late GenericList? genericList;

  @override
  Widget build(BuildContext context) {
    SubSection subSection = widget.sportSectionData[0];
    genericViewModel = context.watch<GenericViewModel>();
    genericViewModel = GenericViewModel(id: subSection.sectionId);
    genericList = genericViewModel.get_genericList;
    print(genericList);

    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.sportSectionData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String? title = widget.sportSectionData[index].name;
                    return InkWell(
                        onTap: () {
                         setState(() {
                           String? sec_id_tab =
                               widget.sportSectionData[index].sectionId;
                           genericViewModel = GenericViewModel(id: sec_id_tab);
                           genericList = genericViewModel.get_genericList;
                           print(genericList);
                         });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                        ));
                  })),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 10),
            child: _updataList(),
          ),
        ],
      ),
    );
  }

  _updataList(){
    ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        GenericItem? ge = genericList?.data?[index];
        print(ge);
        return InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 112,
            margin: const EdgeInsets.only(
              top: 12,
              bottom: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 149,
                    height: 112,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          ge?.imgUrl ?? "",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(16, Colors.black, 1, ge?.title ?? ""),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SmallText(
                                  "National  ", 12, Colors.black, 1.0),
                              SmallText(
                                  "Time  ", 12, Colors.black, 1.0),
                            ],
                          ),
                          Row(
                            children: [
                              SmallIconArticle(
                                'assets/images/share.png',
                                18.0,
                                17.0,
                              ),
                              const SizedBox(
                                width: 18,
                                height: 17,
                              ),
                              SmallIconArticle(
                                  "assets/images/fav.png", 18.0, 17.0),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


