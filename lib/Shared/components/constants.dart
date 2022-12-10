import 'package:flutter/material.dart';

String? userId;
String? role;
const Color defaultColor = Color(0xFF8DC351);
const Color blackColor = Color(0xFF353535);
const Color greyColor = Color(0xFFc1c1c1);
int user_satate=1;
// 1 is newbie user , 2 is subscribed user but not active ,3 is active user



getAPPWidth(context,figma_width){
return (MediaQuery.of(context).size.width)*figma_width/360;
}
getAppheight(context,figma_height){
return ((MediaQuery.of(context).size.height)*figma_height/800);
}
getAppSize(context,figma_size){
  var ratio=figma_size/(360*800);
  var myApp=(MediaQuery.of(context).size.height)*(MediaQuery.of(context).size.width);
return (myApp*ratio);
}
//const ratio_for_nav_bar=3/40;


