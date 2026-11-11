import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/data/dummy_notes.dart';
import 'package:mobile_lanjut_utp/widgets/keep_drawer.dart';
import 'package:mobile_lanjut_utp/widgets/note_grid.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const KeepDrawer(current: 'arsip'),
      appBar: AppBar(
        title: const Text('Arsip', style: TextStyle(fontSize: 22)),
        actions: const [
          Icon(Icons.search, color: Colors.white70),
          SizedBox(width: 12),
          Icon(Icons.view_agenda_outlined, color: Colors.white70),
          SizedBox(width: 16),
        ],
      ),
      // grid card
      body: const NoteGrid(notes: archiveNotes),
    );
  }
}
