import 'package:flutter/material.dart';
import 'package:the_hindu/networking/models/section_list.dart';
import '../repo/api_status.dart';
import '../repo/section_service.dart';


class SectionsViewModel extends ChangeNotifier{
  bool _isLoading = false;
  Sections? _sectionListModel;

  bool get loading => _isLoading;

  Sections? get sectionList => _sectionListModel;
  SectionsViewModel(){
    getSections();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setSectionListModel( Sections sectionList){
    _sectionListModel = sectionList;
  }

  getSections() async {
    setLoading(true);
    var response = await SectionServices.getSections();
    if(response is Success){
      setSectionListModel(response.response as Sections);
    }
  }
}