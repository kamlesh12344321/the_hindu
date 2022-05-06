

import 'package:flutter/material.dart';
import 'package:the_hindu/networking/models/article_list.dart';
import 'package:the_hindu/networking/repo/section_service.dart';

import '../repo/api_status.dart';

class ArticleListViewModel extends ChangeNotifier{
  bool _isLoading = false;
  HomeArticle? _homeArticle;
  bool get loading => _isLoading;
  HomeArticle? get homeArticles => _homeArticle;


  ArticleListViewModel(){
    getArticles();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
  }

  setArticleList(HomeArticle? homeArticleList){
    _homeArticle = homeArticleList;
  }

  getArticles() async {
    setLoading(true);
    var response = await SectionServices.getArticles();
    if(response is Success){
      setArticleList(response.response as HomeArticle?);
      notifyListeners();
    }
  }
}