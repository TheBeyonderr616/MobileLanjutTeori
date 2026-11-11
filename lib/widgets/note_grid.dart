import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/models/note.dart';
import 'package:mobile_lanjut_utp/widgets/note_card.dart';

// Grid (dipakai Home & Arsip)
class NoteGrid extends StatelessWidget {
  final List<Note> notes;
  const NoteGrid({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      itemCount: notes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) => NoteCard(note: notes[index]),
    );
  }
}
