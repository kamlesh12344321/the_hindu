import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:the_hindu/networking/models/generic_data.dart';
import 'package:the_hindu/networking/models/section_list.dart';
import 'package:the_hindu/networking/models/sport_stars.dart';

import '../models/article_list.dart';
import '../utils/section_constants.dart';
import 'api_status.dart';


class SectionServices{
  static Future<Object> getSections() async{
    try{
      var url = Uri.parse(SECTION_LIST);
      var response = await http.get(url);
      if(200 == response.statusCode){
        return Success(response: sectionsFromJson(response.body));
      }
      return Failure(code: 100, failureResponse: "Invalid response");

    } on HttpException{
      return Failure(code: 101, failureResponse: "No Internet");
    } on FormatException{
      return Failure(code: 102, failureResponse: "Invalid format");
    } catch (e){
      return Failure(code: 103, failureResponse: "Unknown error");

    }
  }


  static Future<Object> getArticles() async{
    try{
      var url = Uri.parse(ARTICLE_LIST);
      var response = await http.get(url);
      if(200 == response.statusCode){
        return Success(response: homeArticleFromJson(response.body));
      }
      return Failure(code: 100, failureResponse: "Invalid response");

    } on HttpException{
      return Failure(code: 101, failureResponse: "No Internet");
    } on FormatException{
      return Failure(code: 102, failureResponse: "Invalid format");
    } catch (e){
      return Failure(code: 103, failureResponse: "Unknown error");

    }
  }

  static Future<Object> getSportStars() async{
    try{
      Map data = {
        "section_id": false,
        "article_id": false,
        "property_id" : 2
      };
      var bodyData = json.encode(data);
      var url = Uri.parse(ARTICLE_LIST);
      var response = await http.post(url,
      headers:{"Content-Type": "application/json"},
        body: bodyData
      );
      if(200 == response.statusCode){
        return Success(response: sportStarsFromJson(response.body));
      }
      return Failure(code: 100, failureResponse: "Invalid response");

    } on HttpException{
      return Failure(code: 101, failureResponse: "No Internet");
    } on FormatException{
      return Failure(code: 102, failureResponse: "Invalid format");
    } catch (e){
      return Failure(code: 103, failureResponse: "Unknown error");

    }
  }

  static Future<Object> getGenericArticles(int id) async{
    try{
      Map data = {
        "section_id": id,
        "article_id": false,
      };
      var bodyData = json.encode(data);
      var url = Uri.parse(ARTICLE_LIST);
      var response = await http.post(url,
          headers:{"Content-Type": "application/json"},
          body: bodyData
      );
      if(200 == response.statusCode){
        return Success(response: genericListFromJson(response.body));
      }
      return Failure(code: 100, failureResponse: "Invalid response");

    } on HttpException{
      return Failure(code: 101, failureResponse: "No Internet");
    } on FormatException{
      return Failure(code: 102, failureResponse: "Invalid format");
    } catch (e){
      return Failure(code: 103, failureResponse: "Unknown error");

    }
  }
}