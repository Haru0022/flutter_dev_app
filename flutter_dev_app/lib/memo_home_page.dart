import 'package:flutter/material.dart';
import 'memo.dart';
import 'edit_memo_screen.dart';
import 'view_memo_screen.dart';

class MemoHomePage extends StatefulWidget {
  @override
  _MemoHomePageState createState() => _MemoHomePageState();
}

class _MemoHomePageState extends State<MemoHomePage> {
  List<Memo> memoList = [];

  void _navigateToEditMemo(BuildContext context, [Memo? memo]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMemoScreen(
          memo: memo ?? Memo(title: '', content: ''),
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

  void _navigateToViewMemo(BuildContext context, Memo memo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewMemoScreen(
          memo: memo,
          onSave: (updatedMemo) {
            setState(() {
              int index = memoList.indexOf(memo);
              memoList[index] = updatedMemo;
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
              onTap: () => _navigateToViewMemo(context, memoList[index]),
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    memoList[index].title,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
