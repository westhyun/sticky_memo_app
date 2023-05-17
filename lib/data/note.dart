
import 'package:flutter/material.dart';

class Note { // 노트 데이터 담기

  // 노트 색상
  static const colorDefault = Colors.white;
  static const colorRed = Color(0xFFFFCDD2);
  static const colorOrange = Color(0xFFFFE0B2);
  static const colorYellow = Color(0xFFFFF9C4);
  static const colorLime = Color(0xFFF0F4C3);
  static const colorBlue = Color(0xFFBBDEFB);

  final Color color; // 노트 색상

  final String title; // 노트 제목

  final String body; // 노트 본문

  // 생성자
  Note(
      this.body, { // 본문 필수
        this.title = '', // 제목 선택
        this.color = colorDefault, // 색상 선택 || 기본값
  });
}