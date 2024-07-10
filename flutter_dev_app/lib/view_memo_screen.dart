import 'package:flutter/material.dart';
import 'memo.dart';
import 'edit_memo_screen.dart';

class ViewMemoScreen extends StatelessWidget {
  final Memo memo;
  final ValueChanged<Memo> onSave;

  ViewMemoScreen({required this.memo, required this.onSave});

  void _navigateToEditMemo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMemoScreen(
          memo: memo,
          onSave: (updatedMemo) {
            onSave(updatedMemo);
            Navigator.pop(context); // EditMemoScreenから戻る
            Navigator.pop(context); // ViewMemoScreenから戻る
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memo.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _navigateToEditMemo(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          memo.content,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
