import 'package:flutter/material.dart';
import 'edit_memo_screen.dart';

// メモのリストを表示する画面を提供するためのウィジェット
class MemoHomePage extends StatefulWidget {
  @override
  _MemoHomePageState createState() => _MemoHomePageState();
}

// MemoHomePageの状態を管理するクラス
class _MemoHomePageState extends State<MemoHomePage> {
  // メモリストを保持するリスト
  List<String> memoList = [];

  // メモを編集する画面に遷移するメソッド
  void _navigateToEditMemo(BuildContext context, [String? memo]) {
    // Navigatorを使って画面遷移を行う
    Navigator.push(
      context,
      MaterialPageRoute(
        // EditMemoScreenウィジェットを表示
        builder: (context) => EditMemoScreen(
          // メモの内容を引き渡す。nullの場合は空文字を渡す
          memo: memo ?? '',
          // メモを保存するコールバックを定義
          onSave: (newMemo) {
            setState(() {
              if (memo != null) {
                // 既存のメモを編集する場合、リスト内のメモを置換
                int index = memoList.indexOf(memo);
                memoList[index] = newMemo;
              } else {
                // 新しいメモを追加
                memoList.add(newMemo);
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffoldウィジェットで画面を構築
    return Scaffold(
      appBar: AppBar(
        // アプリのタイトルを設定
        title: Text('メモアプリ'),
      ),
      body: ListView.builder(
        // メモリストの長さを設定
        itemCount: memoList.length,
        // メモリストの各要素を表示するためのUIを構築
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            // メモをタップしたときの動作を定義
            child: GestureDetector(
              onTap: () => _navigateToEditMemo(context, memoList[index]),
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  // メモの内容を表示
                  child: Text(
                    memoList[index],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // フローティングアクションボタンを追加
      floatingActionButton: FloatingActionButton(
        // ボタンを押したときに新しいメモ作成画面に遷移
        onPressed: () => _navigateToEditMemo(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
