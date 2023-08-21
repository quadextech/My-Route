import 'package:flutter/material.dart';


headline1(color) {
  return TextStyle( fontFamily: "Avenir", fontSize:24, fontWeight:FontWeight.bold, color:color);
}
headline2(color) {
  return TextStyle( fontFamily: "Avenir", fontSize:20, fontWeight:FontWeight.w600, color:color);
}
headline3(color) {
  return TextStyle( fontFamily: "Avenir", fontSize:18, fontWeight:FontWeight.bold, color:color);
}
headline4(color) {
  return TextStyle( fontFamily: "Avenir", fontSize:15, fontWeight:FontWeight.bold, color:color);
}

headline5(color) {
  return TextStyle( fontFamily: "Avenir", fontSize:25, fontWeight:FontWeight.w900, color:color);
}


body1(color, decoration) {
  return TextStyle(
      fontFamily: "Avenir", fontSize: 20, color: color, decoration: decoration);
}

body2(color, decoration) {
  return TextStyle( fontFamily: "Avenir", fontSize:18, color:color, decoration: decoration);
}
body3(color, decoration) {
  return TextStyle( fontFamily: "Avenir", fontSize:15, color:color, decoration: decoration);
}
body4(color, decoration) {
  return TextStyle( fontFamily: "Avenir", fontSize:13, color:color, decoration: decoration);
}