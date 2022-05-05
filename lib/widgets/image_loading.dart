import 'package:flutter/cupertino.dart';

class ServiceImageLoading extends StatelessWidget{
  String? imageUrl;

  ServiceImageLoading({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String data = '';
    if(imageUrl != null){
      data = imageUrl ?? "";
    }
    return FadeInImage.assetNetwork(
        placeholder: "assets/images/place_holder.png",
        image: data);
  }
}