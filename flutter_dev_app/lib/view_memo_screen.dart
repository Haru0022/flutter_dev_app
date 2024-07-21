import 'package:flutter/material.dart';
import 'memo.dart';

class ViewMemoScreen extends StatelessWidget {
  final Memo memo;

  ViewMemoScreen({required this.memo, required Null Function(dynamic updatedMemo) onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(memo.content),
      ),
    );
  }
}
