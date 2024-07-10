import 'package:flutter/material.dart';

// メモを編集するための画面を提供するウィジェット
class EditMemoScreen extends StatefulWidget {
  // 編集するメモの内容
  final String memo;
  // 編集されたメモを保存するためのコールバック関数
  final ValueChanged<String> onSave;

  EditMemoScreen({required this.memo, required this.onSave});

  @override
  _EditMemoScreenState createState() => _EditMemoScreenState();
}

// EditMemoScreenの状態を管理するクラス
class _EditMemoScreenState extends State<EditMemoScreen> {
  // テキストフィールドの内容を管理するコントローラー
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // コントローラーを初期化し、初期値としてメモの内容を設定
    _controller = TextEditingController(text: widget.memo);
  }

  @override
  void dispose() {
    // コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 戻るボタンが押されたときにメモの内容を保存
      onWillPop: () async {
        widget.onSave(_controller.text);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // 画面のタイトルを設定
          title: Text('メモを編集'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // テキストフィールドを配置
          child: TextField(
            // テキストコントローラーを設定
            controller: _controller,
            // テキストフィールドの行数を無制限に設定
            maxLines: null,
            // ヒントテキストを設定
            decoration: InputDecoration(
              hintText: 'メモを入力してください',
            ),
          ),
          
        ),
      ),
    );
  }
}
