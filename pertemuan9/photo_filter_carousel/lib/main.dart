import 'package:flutter/material.dart';
import 'widget/filter_carousel.dart';

// [Langkah 6] Implementasi filter carousel ke main
void main() {
  runApp(
    const MaterialApp(
      home: PhotoFilterCarousel(),
      debugShowCheckedModeBanner: false,
    ),
  );
}