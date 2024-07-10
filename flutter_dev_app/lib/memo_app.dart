import 'package:flutter/material.dart';
import 'memo_home_page.dart';

// アプリ全体の設定を行うためのウィジェット
class MemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialAppウィジェットを返し、アプリ全体の設定を行う
    return MaterialApp(
      // アプリのタイトル
      title: 'メモアプリ',
      // アプリのテーマ設定
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // 最初に表示する画面をMemoHomePageに設定
      home: MemoHomePage(),
    );
  }
}
