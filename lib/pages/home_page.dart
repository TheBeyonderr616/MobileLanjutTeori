import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/constants/app_colors.dart';
import 'package:mobile_lanjut_utp/data/dummy_notes.dart';
import 'package:mobile_lanjut_utp/widgets/keep_drawer.dart';
import 'package:mobile_lanjut_utp/widgets/note_grid.dart';
import 'package:mobile_lanjut_utp/pages/add_note_page.dart';
import 'package:mobile_lanjut_utp/pages/search_page.dart';

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
