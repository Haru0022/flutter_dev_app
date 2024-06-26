import 'package:flutter/material.dart';

class EditMemoScreen extends StatefulWidget {
  final String memo;
  final ValueChanged<String> onSave;

  EditMemoScreen({required this.memo, required this.onSave});

  @override
  _EditMemoScreenState createState() => _EditMemoScreenState();
}

class _EditMemoScreenState extends State<EditMemoScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.memo);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onSave(_controller.text);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('メモを編集'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'メモを入力してください',
            ),
          ),
        ),
      ),
    );
  }
}
