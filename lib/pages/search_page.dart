import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/constants/app_colors.dart';

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
