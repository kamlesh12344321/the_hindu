// import 'package:flutter/material.dart';
// import 'package:the_hindu/network/network_status.dart';
// import 'package:provider/provider.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// class NetworkStatusWidget extends StatelessWidget{
//   final Widget onlineChild;
//   final Widget offlineChild;
//   const NetworkStatusWidget({Key? key, required this.onlineChild, required this.offlineChild})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
//     if(networkStatus == NetworkStatus.Online){
//       return onlineChild;
//     } else{
//       return offlineChild;
//     }
//   }
//
//   void _showToastMessage(String message){
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1
//     );
//   }
// }