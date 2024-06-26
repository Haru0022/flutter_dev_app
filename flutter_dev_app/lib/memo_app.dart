import 'package:flutter/material.dart';
import 'memo_home_page.dart';

class MemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'メモアプリ',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MemoHomePage(),
    );
  }
}
