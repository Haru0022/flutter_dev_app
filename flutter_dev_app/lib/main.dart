import 'package:flutter/material.dart';

void main() {
  runApp(MemoApp());
}

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

class MemoHomePage extends StatefulWidget {
  @override
  _MemoHomePageState createState() => _MemoHomePageState();
}

class _MemoHomePageState extends State<MemoHomePage> {
  List<String> memoList = [];

  void _navigateToEditMemo(BuildContext context, [String? memo]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMemoScreen(
          memo: memo ?? '',
          onSave: (newMemo) {
            setState(() {
              if (memo != null) {
                int index = memoList.indexOf(memo);
                memoList[index] = newMemo;
              } else {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('メモアプリ'),
      ),
      body: ListView.builder(
        itemCount: memoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _navigateToEditMemo(context, memoList[index]),
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToEditMemo(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

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
