import 'package:flutter/material.dart';

class BannerAds extends StatefulWidget {
  const BannerAds({Key? key}) : super(key: key);

  @override
  State<BannerAds> createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40,top: 10,bottom: 10,right: 40),
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(5)
      ),
      child: const Center(
        child: Text(
          "Ads",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
