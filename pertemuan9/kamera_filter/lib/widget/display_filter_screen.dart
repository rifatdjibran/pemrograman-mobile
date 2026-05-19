import 'dart:io';
import 'package:flutter/material.dart';
import 'filter_selector.dart';

class DisplayFilterScreen extends StatefulWidget {
  final String imagePath;

  const DisplayFilterScreen({super.key, required this.imagePath});

  @override
  State<DisplayFilterScreen> createState() => _DisplayFilterScreenState();
}

class _DisplayFilterScreenState extends State<DisplayFilterScreen> {
  // Daftar warna filter: putih (no filter) + warna-warna primer Flutter
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  // ValueNotifier agar hanya bagian foto yang rebuild saat filter berganti
  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  void dispose() {
    _filterColor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Foto - 244107060138'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Foto hasil jepretan mengisi seluruh layar dengan filter warna
          Positioned.fill(
            child: ValueListenableBuilder<Color>(
              valueListenable: _filterColor,
              builder: (context, color, child) {
                return Image.file(
                  File(widget.imagePath),
                  // Blend warna filter ke atas foto
                  color: color == Colors.white
                      ? null
                      : color.withOpacity(0.5),
                  colorBlendMode: BlendMode.color,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Filter carousel di bagian bawah layar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FilterSelector(
              filters: _filters,
              onFilterChanged: _onFilterChanged,
            ),
          ),
        ],
      ),
    );
  }
}