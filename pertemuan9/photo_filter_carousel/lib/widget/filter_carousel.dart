import 'package:flutter/material.dart';
import 'filter_selector.dart';

// [Langkah 3] Widget utama photo filter carousel
@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  // [Langkah 3] Daftar filter: putih sebagai default, lalu warna-warna primer
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  // [Langkah 3] ValueNotifier untuk menyimpan warna filter aktif saat ini
  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          // [Langkah 3] Foto dengan filter warna di belakang
          Positioned.fill(child: _buildPhotoWithFilter()),
          // [Langkah 3] Filter selector di bagian bawah layar
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  // [Langkah 3] Foto dengan blending warna filter menggunakan ValueListenableBuilder
  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        return Image.network(
          'https://picsum.photos/seed/flutter/800/1200',
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
        );
      },
    );
  }

  // [Langkah 3] Bangun widget FilterSelector dengan daftar filter
  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}