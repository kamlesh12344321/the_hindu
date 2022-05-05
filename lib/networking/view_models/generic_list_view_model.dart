

import 'package:flutter/material.dart';
import 'package:the_hindu/networking/models/generic_data.dart';
import 'package:the_hindu/networking/repo/api_status.dart';
import 'package:the_hindu/networking/repo/section_service.dart';

class GenericViewModel extends ChangeNotifier{

  bool _isLoading = false;
  GenericList? _genericList;
  var id;

  GenericViewModel({this.id}){
    getGenericList();
  }

  bool get loading => _isLoading;
  GenericList? get get_genericList => _genericList;


  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setGenericListModel( GenericList? genericList){
    genericList = _genericList;
  }

  getGenericList() async {
    setLoading(true);
    var response = await SectionServices.getGenericArticles(id);
    if(response is Success){
      setGenericListModel(response.response as GenericList?);
    }
  }
}