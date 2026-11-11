import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/constants/app_colors.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  // tombol kotak bulat (dipakai di AppBar dan bar bawah)
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
        // tombol back
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        // ikon pin, tambah kolaborator, dan arsip
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
            // TextField Judul
            const TextField(
              style: TextStyle(fontSize: 28),
              decoration: InputDecoration(
                hintText: 'Judul',
                hintStyle: TextStyle(fontSize: 28, color: Colors.white38),
                border: InputBorder.none,
              ),
            ),
            // TextField Catatan (multiline)
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
      // bar tombol di bagian bawah
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
