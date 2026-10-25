import 'package:flutter/material.dart';

void main() {
  runApp(const KeepApp());
}

const Color kBackground = Color(0xFF0E1511); // background utama
const Color kSearchBackground = Color(0xFF1A211B); // background halaman cari
const Color kGreenAccent = Color(0xFF6BF29A); // teks/ikon hijau muda
const Color kGreenDark = Color(0xFF075A27); // pill drawer & tombol FAB
const Color kButtonBg = Color(0xFF1F2A23); // tombol kotak bulat di AppBar
const Color kChipBg = Color(0xFF2A4F3F); // lingkaran filter di pencarian

class KeepApp extends StatelessWidget {
  const KeepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Keep Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      // Batasi lebar app supaya tampil seperti layar HP saat dijalankan di web
      builder: (context, child) {
        return Container(
          color: Colors.black, 
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: child,
          ),
        );
      },
      home: const HomePage(),
    );
  }
}

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

// Data dummy untuk Beranda
const List<Note> homeNotes = [
  Note(
    title: 'LINUX UBUNTU',
    body: 'Name Account:\nuser_demo\nPW: ********',
    color: Color.fromARGB(255, 111, 227, 57),
  ),
  Note(
    title: 'TB & BB',
    body: 'Tinggi Badan:\n170 cm\nBerat Badan:\n65 kg\nGol Darah: A+',
    color: Color.fromARGB(255, 228, 58, 154),
  ),
  Note(
    title: 'PW Mortal Kombat and etc.',
    body: '(MK)\nAkun:\nuser_demo@gmail.com\nPW: ********',
    color: Color(0xFF264D3B),
    hasImage: true,
  ),
  Note(
    title: 'POLISI CALL CENTER',
    body: '110\n\nHOT LINE\nAMBULANCE\nLAMPUNG\nFREE\n\n0822 7822 1400',
    color: Color(0xFF3B4A50),
    borderColor: Color(0xFF8A5A1E),
  ),
  Note(
    title: 'Link Ngirim Kerja SI GAJAH LAMPUNG',
    body: 'https://contoh-link.com',
    color: Color(0xFF4A5056),
  ),
  Note(
    title: '',
    body: 'E-mail:\nuser_demo@gmail.com\nSandi: ********\n\nE-mail:\nuser_demo2@gmail.com\nSandi: ********',
    color: Color(0xFF77424E),
  ),
];

// Data dummy untuk Reminders (Pengingat)
final List<Note> reminderNotes = [
  Note(
    title: 'Rapat Tim Mobile',
    body: 'Persiapan presentasi UTP minggu depan',
    color: Color(0xFF264D3B),
    reminder: DateTime.now().add(const Duration(days: 1, hours: 2)), // Besok jam 10:00
  ),
  Note(
    title: 'Belanja Bulanan',
    body: 'Beras 5kg\nTelur 2kg\nMinyak 2L\nKopi hitam\nSabun cuci',
    color: Color(0xFF3B4A50),
    reminder: DateTime.now().add(const Duration(days: 2, hours: 5)), // 2 hari lagi jam 13:00
  ),
  Note(
    title: 'Bayar Tagihan',
    body: 'Listrik: Rp 450.000\nAir: Rp 120.000\nInternet: Rp 350.000\nBPJS: Rp 150.000',
    color: Color(0xFF77424E),
    reminder: DateTime.now().add(const Duration(days: 5)), // 5 hari lagi
  ),
  Note(
    title: 'Ulang Tahun Mama',
    body: 'Beli kue di Bakery favorit\nSiapkan hadiah\nVideo call jam 19:00',
    color: Color.fromARGB(255, 228, 58, 154),
    reminder: DateTime.now().add(const Duration(days: 10, hours: 3)), // 10 hari lagi jam 09:00
  ),
  Note(
    title: 'Deadline Tugas MOLA',
    body: '4 tampilan Flutter\nKumpul pertemuan 9\nJangan lupa test di device fisik',
    color: Color(0xFF4A5056),
    reminder: DateTime.now().add(const Duration(hours: 6)), // Hari ini jam 6 jam lagi
  ),
];

// Data dummy untuk Arsip
const List<Note> archiveNotes = [
  Note(
    title: 'Tugas Mobile Lanjut',
    body: 'UTP MOLA: buat 4 tampilan Flutter, dikumpulkan pertemuan 9.',
    color: Color(0xFF3A3F45),
  ),
  Note(
    title: 'Daftar Belanja',
    body: 'Beras\nTelur\nMinyak goreng\nKopi',
    color: Color(0xFF33423A),
  ),
  Note(
    title: 'Ide Proyek',
    body: 'Aplikasi pencatat keuangan sederhana dengan Flutter.',
    color: Color(0xFF3F3A47),
  ),
  Note(
    title: 'Jadwal Kuliah',
    body: 'Senin: Mobile Lanjut\nSelasa: Keamanan Sistem\nRabu: Basis Data',
    color: Color(0xFF45393A),
  ),
];

// KARTU CATATAN
class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color,
      margin: EdgeInsets.zero,
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
          Expanded(
            child: Padding(
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
                  Expanded(
                    child: Text(
                      note.body,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.3,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// WIDGET BERSAMA: GRID CATATAN (dipakai Home & Arsip)
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

// WIDGET BERSAMA: DRAWER (menu samping)
class KeepDrawer extends StatelessWidget {
  final String current; // 'catatan' atau 'arsip'
  const KeepDrawer({super.key, required this.current});

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap ?? () => Navigator.pop(context),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: selected ? kGreenDark : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Icon(icon, color: selected ? kGreenAccent : Colors.white70),
              const SizedBox(width: 28),
              Text(
                label,
                style: TextStyle(
                  fontSize: 17,
                  color: selected ? kGreenAccent : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 12, top: 12),
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 24),
              child: Text(
                'Google Keep',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),

            // Menu: Catatan -> kembali ke Beranda
            _item(
              context,
              icon: Icons.lightbulb_outline,
              label: 'Catatan',
              selected: current == 'catatan',
              onTap: () {
                Navigator.pop(context);
                if (current != 'catatan') {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              },
            ),
            _item(
              context,
              icon: Icons.notifications_none,
              label: 'Pengingat',
              selected: current == 'pengingat',
              onTap: () {
                Navigator.pop(context);
                if (current != 'pengingat') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RemindersPage()),
                  );
                }
              },
            ),
            _item(context, icon: Icons.add, label: 'Buat label baru'),
            // Menu: Arsip -> buka ArchivePage
            _item(
              context,
              icon: Icons.archive_outlined,
              label: 'Arsip',
              selected: current == 'arsip',
              onTap: () {
                Navigator.pop(context);
                if (current != 'arsip') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ArchivePage()),
                  );
                }
              },
            ),
            _item(context, icon: Icons.delete_outline, label: 'Sampah'),
            _item(context, icon: Icons.settings_outlined, label: 'Setelan'),
            _item(context, icon: Icons.help_outline, label: 'Bantuan & masukan'),
          ],
        ),
      ),
    );
  }
}

// 1. HOMEPAGE (BERANDA)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const KeepDrawer(current: 'catatan'),
      // AppBar berbentuk kolom pencarian 
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Container(
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF2A322D),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              // Ikon menu -> buka Drawer
              Builder(
                builder: (ctx) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              ),
              // Teks "Telusuri Keep"
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchPage()),
                  ),
                  child: const Text(
                    'Telusuri Keep',
                    style: TextStyle(fontSize: 18, color: Colors.white60),
                  ),
                ),
              ),
              const Icon(Icons.view_agenda_outlined, color: Colors.white70),
              const SizedBox(width: 12),
              const Icon(Icons.swap_vert, color: Colors.white70),
              const SizedBox(width: 12),
              // Foto profil (lingkaran dengan border biru)
              Container(
                width: 44,
                height: 44,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF3D6FE0), width: 3),
                  color: const Color(0xFF0B1F2E),
                ),
                child: const Icon(Icons.person, size: 22, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
            child: Text(
              'Dipasangi pin',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          // GridView berisi kumpulan Card catatan
          const Expanded(child: NoteGrid(notes: homeNotes)),
        ],
      ),
      // Tombol "+" -> buka AddNotePage
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
}


// 2. ADDNOTEPAGE (TAMBAH CATATAN)
class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  // Tombol kotak membulat (dipakai di AppBar dan bar bawah)
  Widget _roundButton(IconData icon, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: kButtonBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.white70),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tombol back
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        // Ikon pin, tambah kolaborator, dan arsip
        actions: [
          _roundButton(Icons.push_pin_outlined),
          _roundButton(Icons.person_add_alt),
          _roundButton(Icons.archive_outlined),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            // TextField Judul (besar, tanpa garis bawah)
            const TextField(
              style: TextStyle(fontSize: 28),
              decoration: InputDecoration(
                hintText: 'Judul',
                hintStyle: TextStyle(fontSize: 28, color: Colors.white38),
                border: InputBorder.none,
              ),
            ),
            // TextField Catatan (multiline, tanpa garis bawah)
            const Expanded(
              child: TextField(
                maxLines: null, // boleh banyak baris
                expands: true, // isi sisa ruang
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Catatan',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.white38),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      // Bar tombol di bagian bawah
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 20, 12),
          child: Row(
            children: [
              _roundButton(Icons.add_box_outlined),
              _roundButton(Icons.palette_outlined),
              _roundButton(Icons.text_format),
              const Spacer(),
              _roundButton(Icons.more_vert),
            ],
          ),
        ),
      ),
    );
  }
}

// 3. ARCHIVEPAGE (ARSIP)
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
      // Sama seperti beranda, tapi warna kartu lebih redup
      body: const NoteGrid(notes: archiveNotes),
    );
  }
}

// 4. SEARCHPAGE (PENCARIAN)
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  // Judul bagian + tulisan "Lainnya" di kanan
  Widget _sectionHeader(String title, {bool showMore = true}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
          if (showMore)
            const Text(
              'Lainnya',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1ED760),
              ),
            ),
        ],
      ),
    );
  }

  // Satu pilihan filter: lingkaran lonjong + label di bawahnya
  Widget _filter(IconData icon, String label) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 56,
            decoration: BoxDecoration(
              color: kChipBg,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(icon, color: kGreenAccent),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  // Satu pilihan warna
  Widget _colorPill(Color? color) {
    return Container(
      width: 80,
      height: 56,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white54, width: 1),
      ),
      // Pill pertama = "tanpa warna"
      child: color == null
          ? const Icon(Icons.format_color_reset, color: Color(0xFF1ED760))
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Daftar warna di bagian "Warna" (null = tanpa warna)
    final List<Color?> colors = [
      null,
      const Color(0xFF77172E),
      const Color(0xFF692B17),
      const Color(0xFF7C4A03),
      const Color(0xFF264D3B),
      const Color(0xFF0C625D),
      const Color(0xFF256377),
      const Color(0xFF284255),
      const Color(0xFF472E5B),
      const Color(0xFF4B443A),
    ];

    return Scaffold(
      backgroundColor: kSearchBackground,
      // AppBar khusus: langsung berisi kolom input pencarian
      appBar: AppBar(
        backgroundColor: kSearchBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const TextField(
          autofocus: true,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: 'Telusuri Keep',
            hintStyle: TextStyle(fontSize: 20, color: Colors.white60),
            border: InputBorder.none,
          ),
        ),
        // Garis pemisah di bawah AppBar
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white24),
        ),
      ),
      body: ListView(
        children: [
          // --- Bagian Jenis ---
          _sectionHeader('Jenis'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _filter(Icons.check_box_outlined, 'Daftar'),
              _filter(Icons.image_outlined, 'Gambar'),
              _filter(Icons.brush, 'Gambar'),
            ],
          ),
          // --- Bagian Berbagai Hal ---
          _sectionHeader('Berbagai Hal'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _filter(Icons.book, 'Buku'),
              _filter(Icons.restaurant, 'Makanan'),
              _filter(Icons.movie_outlined, 'Film'),
            ],
          ),
          // --- Bagian Warna ---
          _sectionHeader('Warna', showMore: false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true, // supaya muat di dalam ListView
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.45,
              children: colors.map((c) => Center(child: _colorPill(c))).toList(),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// Helper: format reminder datetime ke string "Hari, dd MMM • HH:mm"
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

// 5. REMINDERSPAGE (PENGINGAT)
class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Urutkan reminder: yang terdekat di atas
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