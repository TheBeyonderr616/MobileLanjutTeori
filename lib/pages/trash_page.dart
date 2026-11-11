import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/constants/app_colors.dart';
import 'package:mobile_lanjut_utp/data/dummy_notes.dart';
import 'package:mobile_lanjut_utp/models/note.dart';
import 'package:mobile_lanjut_utp/widgets/keep_drawer.dart';
import 'package:mobile_lanjut_utp/widgets/note_grid.dart';

class TrashPage extends StatefulWidget {
  const TrashPage({super.key});

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  List<Note> _notes = List.of(trashNotes);

  // Kosongkan Sampah
  void _confirmEmptyTrash() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: kSearchBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        content: const Text(
          'Kosongkan Sampah? Semua catatan di Sampah akan dihapus secara permanen.',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: kGreenAccent)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() => _notes = []);
            },
            child: const Text(
              'Kosongkan Sampah',
              style: TextStyle(color: kGreenAccent),
            ),
          ),
        ],
      ),
    );
  }

  // Tampilan saat Sampah kosong
  Widget _emptyState() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.delete_outline, size: 120, color: Colors.white24),
          SizedBox(height: 16),
          Text(
            'Tidak ada catatan di Sampah',
            style: TextStyle(fontSize: 16, color: Colors.white60),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const KeepDrawer(current: 'sampah'),
      appBar: AppBar(
        title: const Text('Sampah', style: TextStyle(fontSize: 22)),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white70),
            color: kButtonBg,
            enabled: _notes.isNotEmpty,
            onSelected: (_) => _confirmEmptyTrash(),
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'kosongkan',
                child: Text('Kosongkan Sampah'),
              ),
            ],
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: _notes.isEmpty
          ? _emptyState()
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 8, 24, 16),
                  child: Text(
                    'Catatan di Sampah dihapus setelah 7 hari.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ),
                Expanded(child: NoteGrid(notes: _notes)),
              ],
            ),
    );
  }
}
