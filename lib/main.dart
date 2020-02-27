import 'package:clone_youtube/home.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      home: Home(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    )
  );
}