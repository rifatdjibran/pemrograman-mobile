// ==================================================================
// lib/widget/displaypicture_screen.dart — Praktikum 1: Kamera
// ==================================================================

import 'dart:io';
import 'package:flutter/material.dart';

// [Langkah 7] Widget baru untuk menampilkan foto yang sudah diambil
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Ganti NIM sesuai dengan NIM Anda
        title: const Text('Display the Picture - 244107060138'),
      ),
      // [Langkah 7] Tampilkan gambar dari path file menggunakan Image.file
      body: Image.file(File(imagePath)),
    );
  }
}