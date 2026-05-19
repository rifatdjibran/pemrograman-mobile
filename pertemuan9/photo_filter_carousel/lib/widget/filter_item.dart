import 'package:flutter/material.dart';

// [Langkah 5] Widget bulat yang menampilkan thumbnail foto dengan warna filter
@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          // [Langkah 5] ClipOval untuk membuat tampilan thumbnail berbentuk lingkaran
          child: ClipOval(
            child: Image.network(
              'https://picsum.photos/seed/texture/200/200',
              // [Langkah 5] Warna filter di-blend dengan mode hardLight
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
            ),
          ),
        ),
      ),
    );
  }
}