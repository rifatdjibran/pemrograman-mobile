// ================================================
// lib/main.dart — Praktikum 1: Kamera Flutter
// ================================================

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'widget/takepicture_screen.dart';

// [Langkah 3] Ubah void main() menjadi async function
Future<void> main() async {
  // [Langkah 3] Ensure plugin services initialized sebelum availableCameras()
  WidgetsFlutterBinding.ensureInitialized();

  // [Langkah 3] Dapatkan daftar kamera yang tersedia di device
  final cameras = await availableCameras();

  // [Langkah 3] Ambil kamera pertama dari daftar
  final firstCamera = cameras.first;

  // [Langkah 8] Jalankan aplikasi dengan TakePictureScreen
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // [Langkah 8] Teruskan kamera pertama ke TakePictureScreen
        camera: firstCamera,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}