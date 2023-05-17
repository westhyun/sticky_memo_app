import 'package:flutter/material.dart';
import 'package:sticky_memo_app/page/note_edit_page.dart';
// import 'package:sticky_memo_app/page/note_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: NoteEditPage(),
      // NoteListPage(), // 노트 목록 페이지
    );
  }
}
