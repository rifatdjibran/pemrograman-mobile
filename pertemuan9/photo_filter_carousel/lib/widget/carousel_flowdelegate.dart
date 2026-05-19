import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;

// [Langkah 4] FlowDelegate untuk mengatur tata letak dan animasi item carousel
class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;

    // [Langkah 4] Total lebar area painting
    final size = context.size.width;

    // [TroubleShoot] Guard jika ukuran belum siap
    if (size <= 0 || count == 0) return;
 
    // [Langkah 4] Lebar satu item filter
    final itemExtent = size / filtersPerScreen;

    // [TroubleShoot] Guard jika ukuran belum siap
    if (itemExtent <= 0) return;

    // [Langkah 4] Posisi scroll aktif dalam satuan item (mis. 1.3 artinya
    // item ke-1 aktif dan sudah scroll 30% ke item ke-2)
    final active = viewportOffset.pixels / itemExtent;

    // [Langkah 4] Index item pertama yang perlu dirender (maks 3 ke kiri)
    final min = math.max(0, active.floor() - 3).toInt();

    // [Langkah 4] Index item terakhir yang perlu dirender (maks 3 ke kanan)
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    // [Langkah 4] Generate transform untuk setiap item yang terlihat
    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();

      // [Langkah 4] Skala item: 0.5 (jauh) hingga 1.0 (di tengah/aktif)
      final itemScale = 0.5 + (percentFromCenter * 0.5);

      // [Langkah 4] Opacity item: 0.25 (jauh) hingga 1.0 (aktif)
      final opacity = 0.25 + (percentFromCenter * 0.75);

      // [Langkah 4] Matrix transform untuk posisi, skala, dan sentrisasi item
      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(
        index,
        transform: itemTransform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    // [Langkah 4] Repaint hanya jika viewportOffset berubah (scroll)
    return oldDelegate.viewportOffset != viewportOffset;
  }
}