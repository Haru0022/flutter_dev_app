import 'package:flutter/material.dart';
import 'edit_memo_screen.dart';

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
