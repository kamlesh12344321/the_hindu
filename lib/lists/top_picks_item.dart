import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_hindu/networking/models/article_list.dart';
import 'package:the_hindu/utils/CustomColors.dart';

import '../article_detail.dart';
import '../networking/utils/section_constants.dart';

class TopPicksView extends StatefulWidget {
  List<Article>? data;

  TopPicksView({Key? key, required this.data}) : super(key: key);

  @override
  State<TopPicksView> createState() => _TopPicksViewState();
}

class _TopPicksViewState extends State<TopPicksView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data?.length,
          itemBuilder: (context, index) {
            Article? article = widget.data![index];
              String imageUrl = article.imgUrl;
            return Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10, left: 16, right: 10),
              width: 149,
              height: 112,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: InkWell(
                      onTap: (){
                        _sendDataToSecondScreen(context, widget.data?[index].description);
                      },
                      child: Container(
                        width: 139.0,
                        height: 112.0,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 149.0,
                            height: 112.0,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset("assets/images/place_holder.png"),
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 5,left: 4),
                        child: Text(
                          widget.data?[index].title ?? "",
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                          fontFamily: "FiraSans"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
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
