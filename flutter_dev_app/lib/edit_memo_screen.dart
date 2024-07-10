import 'package:flutter/material.dart';
import 'memo.dart';

class EditMemoScreen extends StatefulWidget {
  final Memo memo;
  final ValueChanged<Memo> onSave;

  EditMemoScreen({required this.memo, required this.onSave});

  @override
  _EditMemoScreenState createState() => _EditMemoScreenState();
}

class _EditMemoScreenState extends State<EditMemoScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.memo.title);
    _contentController = TextEditingController(text: widget.memo.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveMemo() {
    widget.onSave(
      Memo(
        title: _titleController.text,
        content: _contentController.text,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メモを編集'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveMemo,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'タイトルを入力してください',
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: '本文を入力してください',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
