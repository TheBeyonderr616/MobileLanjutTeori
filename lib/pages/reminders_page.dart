import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/constants/app_colors.dart';
import 'package:mobile_lanjut_utp/data/dummy_notes.dart';
import 'package:mobile_lanjut_utp/models/note.dart';
import 'package:mobile_lanjut_utp/pages/add_note_page.dart';
import 'package:mobile_lanjut_utp/widgets/keep_drawer.dart';

// format reminder datetime ke string "Hari, dd MMM | HH:mm"
String _formatReminder(DateTime dt) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(const Duration(days: 1));
  final noteDate = DateTime(dt.year, dt.month, dt.day);

  String dayLabel;
  if (noteDate == today) {
    dayLabel = 'Hari ini';
  } else if (noteDate == tomorrow) {
    dayLabel = 'Besok';
  } else {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    dayLabel = '${dt.day} ${months[dt.month - 1]}';
  }

  final hour = dt.hour.toString().padLeft(2, '0');
  final minute = dt.minute.toString().padLeft(2, '0');
  return '$dayLabel • $hour:$minute';
}

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // urutkan reminder yang terdekat di atas
    final sortedNotes = [...reminderNotes]
      ..sort((a, b) {
        if (a.reminder == null && b.reminder == null) return 0;
        if (a.reminder == null) return 1;
        if (b.reminder == null) return -1;
        return a.reminder!.compareTo(b.reminder!);
      });

    return Scaffold(
      drawer: const KeepDrawer(current: 'pengingat'),
      appBar: AppBar(
        title: const Text('Pengingat', style: TextStyle(fontSize: 22)),
        actions: const [
          Icon(Icons.search, color: Colors.white70),
          SizedBox(width: 12),
          Icon(Icons.view_agenda_outlined, color: Colors.white70),
          SizedBox(width: 16),
        ],
      ),
      body: sortedNotes.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
              itemCount: sortedNotes.length,
              itemBuilder: (context, index) {
                final note = sortedNotes[index];
                final isOverdue = note.reminder != null && note.reminder!.isBefore(DateTime.now());
                return _ReminderCard(note: note, isOverdue: isOverdue);
              },
            ),
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          backgroundColor: kGreenDark,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddNotePage()),
            );
          },
          child: const Icon(Icons.add, size: 40, color: kGreenAccent),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: kButtonBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.notifications_none, size: 60, color: Colors.white38),
            ),
            const SizedBox(height: 24),
            const Text(
              'Belum ada pengingat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tambahkan pengingat ke catatan\nuntuk melihatnya di sini',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white60, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReminderCard extends StatelessWidget {
  final Note note;
  final bool isOverdue;

  const _ReminderCard({required this.note, required this.isOverdue});

  @override
  Widget build(BuildContext context) {
    final reminderText = note.reminder != null ? _formatReminder(note.reminder!) : '';
    final reminderColor = isOverdue ? Colors.redAccent : kGreenAccent;

    return Card(
      color: note.color,
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: note.borderColor != null
            ? BorderSide(color: note.borderColor!, width: 1.5)
            : BorderSide.none,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (note.hasImage)
            Container(
              height: 90,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0B3C3A), Color(0xFF1F6F6A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.person, size: 48, color: Colors.white54),
            ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (note.title.isNotEmpty) ...[
                  Text(
                    note.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                // Isi catatan
                Text(
                  note.body,
                  overflow: TextOverflow.fade,
                  maxLines: 4,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.3,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 12),
                // Badge reminder
                Row(
                  children: [
                    Icon(
                      Icons.alarm_on,
                      size: 16,
                      color: reminderColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      reminderText,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: reminderColor,
                      ),
                    ),
                    if (isOverdue) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'TERLAMBAT',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
