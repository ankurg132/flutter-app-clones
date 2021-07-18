import 'dart:ui';
import 'package:flutter/material.dart';

class Posts{
  AssetImage dp;
  String username;
  int likes;
  AssetImage post;
  String caption;
  Posts(@required this.dp,@required  this.username,@required  this.likes,@required  this.post,@required this.caption);
}