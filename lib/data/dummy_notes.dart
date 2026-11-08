import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/models/note.dart';

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

// Data dummy untuk Sampah
const List<Note> trashNotes = [
  Note(
    title: 'Catatan Rapat',
    body: 'Rapat organisasi hari Jumat jam 3 sore di ruang 204.',
    color: Color(0xFF3A3F45),
  ),
  Note(
    title: 'Resep Nasi Goreng',
    body: 'Nasi\nBawang merah\nBawang putih\nKecap manis\nTelur',
    color: Color(0xFF4B443A),
  ),
  Note(
    title: '',
    body: 'Jangan lupa bayar kos tanggal 5.',
    color: Color(0xFF284255),
  ),
  Note(
    title: 'Draft Laporan',
    body: 'BAB 1 Pendahuluan\nBAB 2 Landasan Teori\nBAB 3 Metodologi',
    color: Color(0xFF472E5B),
  ),
];
