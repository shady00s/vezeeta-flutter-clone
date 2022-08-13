import 'package:flutter/material.dart';

abstract class TextStyling extends TextStyle{
  static const titleStyleText = TextStyle(fontSize: 16,fontWeight: FontWeight.w600);
  static const subTitleStyleText =  TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.grey,overflow: TextOverflow.visible);
}