


import 'package:flutter/material.dart';
import 'package:the_hindu/networking/models/sport_stars.dart';
import 'package:the_hindu/networking/repo/api_status.dart';
import 'package:the_hindu/networking/repo/section_service.dart';

class SportStarsViewModel extends ChangeNotifier{
  bool _isLoading = false;
  SportStars? _sportStars;
  bool get loading => _isLoading;
  SportStars? get sportStars => _sportStars;

  SportStarsViewModel(){
    getSportStars();
  }
  setLoading(bool loading) async {
    _isLoading = loading;
  }

  setSportStarsList(SportStars? sportStars){
    _sportStars = sportStars;
  }

   getSportStars() async {
     setLoading(true);
     var response = await SectionServices.getSportStars();
     if(response is Success){
       setSportStarsList(response.response as SportStars?);
       notifyListeners();
     }
   }
}