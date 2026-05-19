// ============================================================
// lib/widget/takepicture_screen.dart — Praktikum 1: Kamera
// ============================================================

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'displaypicture_screen.dart';

// [Langkah 4] StatefulWidget untuk layar pengambilan foto
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  // [Langkah 4] Variabel untuk menyimpan CameraController
  late CameraController _controller;

  // [Langkah 4] Variabel untuk menyimpan Future inisialisasi controller
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // [Langkah 4] Buat CameraController dengan kamera dan resolusi medium
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    // [Langkah 4] Inisialisasi controller, hasilnya disimpan ke Future
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // [Langkah 4] Dispose controller saat widget dihapus dari tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Ganti NIM sesuai dengan NIM Anda
        title: const Text('Take a picture - 244107060138'),
      ),

      // [Langkah 5] FutureBuilder untuk menunggu inisialisasi controller selesai
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // [Langkah 5] Controller selesai diinisialisasi, tampilkan preview
            return CameraPreview(_controller);
          } else {
            // [Langkah 5] Masih loading, tampilkan loading spinner
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      // [Langkah 6] FloatingActionButton untuk mengambil foto
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // [Langkah 6] Bungkus dalam try/catch untuk handle error
          try {
            // [Langkah 6] Pastikan kamera sudah diinisialisasi
            await _initializeControllerFuture;

            // [Langkah 6] Ambil gambar dan dapatkan path file-nya
            final image = await _controller.takePicture();

            // [Langkah 9] Cek apakah widget masih di dalam tree
            if (!context.mounted) return;

            // [Langkah 9] Navigasi ke DisplayPictureScreen dengan path gambar
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // [Langkah 6] Log error jika terjadi kesalahan
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}