import 'package:flutter/material.dart';
import 'package:sticky_memo_app/data/note.dart';

class NoteEditPage extends StatefulWidget {
  // 위젯 상태 관리할 클래스
  @override
  State createState() => _NoteEditPageState();
}

// 위젯 상태 관리 및 UI class
class _NoteEditPageState extends State<NoteEditPage> {
  // 제목 텍스트 관리
  final titleController = TextEditingController();

  // 본문 텍스트 관리
  final bodyController = TextEditingController();

  // 노트 배경 색상
  Color color = Note.colorDefault;

  @override
  Widget build(BuildContext context) {
    // 화면 그려주는 함수
    return Scaffold(
        // 화면 뼈대
        appBar: AppBar(
          title: Text('노트 편집'), // 노트 제목
          actions: [ // 버튼 추가
            IconButton(
              onPressed: _displayColorSelectionDialog, // 선택시 dialog 띄우기
              icon: Icon(Icons.color_lens),
              tooltip: '배경색 선택',
            ), // 노트 색상 변경 버튼
          ],
        ),
        body: Container(
          color: color, // 노트 배경 색상
          child: SingleChildScrollView(
            // 노트 편집 시 화면을 넘어가는 경우 스크롤
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            // 제목, 본문 margin가
            child: Column(
              // 제목과 본문은 수직방향
              mainAxisSize: MainAxisSize.min, // 본문은 작성한 내용만큼만 차지
              children: [
                // 입력 필드
                TextField(
                  // text 형식을 user에게 입력받음
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // 제목 필드 border
                    labelText: '제목 입력,', // 제목
                  ),
                  maxLines: 1, // 제목 표시할 line 수
                  style: TextStyle(fontSize: 20.0), // 제목 크기
                  controller: titleController, // 제목 text 생성, 편집 위해 controller
                ),
                SizedBox(
                  height: 8.0,
                ), // 제목-본문 사이 공백
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none, // 본문 border none
                    hintText: '노트 입력', // 노트 본문 입력 안내 text
                  ),
                  maxLines: null, // 본문 내용만큼 늘어날 수 있도록
                  keyboardType: TextInputType.multiline, // 개행
                  controller: bodyController, // 본문 text controller
                )
              ],
            ),
          ),
        ));
  }

  void _displayColorSelectionDialog() { // 배경색 선택 버튼 눌렀을 때 실행할 함수
    FocusManager.instance.primaryFocus?.unfocus(); // 키보드 내려가도록 설정

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('배경색 선택'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile( // 선택 항목
              title: Text('없음'),
              onTap: () => _applyColor(Note.colorDefault), // 선택 눌렀을 때 실행 함수
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Note.colorRed,),
              title: Text('빨간색'),
              onTap: () => _applyColor(Note.colorRed),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Note.colorOrange,),
              title: Text('주황색'),
              onTap: () => _applyColor(Note.colorOrange),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Note.colorLime,),
              title: Text('초록색'),
              onTap: () => _applyColor(Note.colorLime),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Note.colorBlue,),
              title: Text('파란색'),
              onTap: () => _applyColor(Note.colorBlue),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Note.colorYellow,),
              title: Text('노란색'),
              onTap: () => _applyColor(Note.colorYellow),
            )
          ],
        ),
      );
    },);
  }

  void _applyColor(Color newColor) {
    setState(() {
      Navigator.pop(context); // 화면의 네비게이터 닫기
      color = newColor; // 새로운 색상 적용
    });
  }
}
