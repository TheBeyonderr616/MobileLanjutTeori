import 'package:flutter/material.dart';

class Note {
  final String title;
  final String body;
  final Color color;
  final Color? borderColor;
  final bool hasImage;
  final DateTime? reminder;

  const Note({
    required this.title,
    required this.body,
    required this.color,
    this.borderColor,
    this.hasImage = false,
    this.reminder,
  });
}
