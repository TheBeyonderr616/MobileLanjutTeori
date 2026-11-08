import 'package:flutter/material.dart';

import 'package:mobile_lanjut_utp/constants/app_colors.dart';
import 'package:mobile_lanjut_utp/pages/home_page.dart';

void main() {
  runApp(const KeepApp());
}

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
