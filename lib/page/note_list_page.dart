import 'package:flutter/material.dart';

import '../data/note.dart';

// 노드 목록
class NoteListPage extends StatefulWidget {

  @override
  State createState() => _NoteListPageState();
}

// 노드 목록 상태
class _NoteListPageState extends State<NoteListPage> {

  // 노트 목록 화면 디자인
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('✍️Sticky Memo'),
      ),
      body: GridView(
        children: _buildCards(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 가로 방향 개수
          childAspectRatio: 1, // 정사각형
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
      ),
    );
  }

  // 노트 데이터 => 카드 형태
  List<Widget> _buildCards() {
    final notes = <Note>[];
    return notes.map((note) => _buildCard(note)).toList();
  }

  // 노트 화면 보일 노트 내용
  Widget _buildCard(Note note) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 세로방향 크기
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽부터 정렬
          children: [
            Text(
              note.title.isEmpty ? '(제목 없음)' : note.title,
              style: TextStyle( // 제목
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded( // 본문
                child: Text(
                  note.body,
                  overflow: TextOverflow.fade,
                )
            ),
          ]
        ),
      ),
    );
  }
}
