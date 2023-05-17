
class Note { // 노트 데이터 담기
  final String title; // 노트 제목

  final String body; // 노트 본문

  // 생성자
  Note(this.body, {
    this.title = ''
  }); // 본문은 필수, 제목은 선택
}