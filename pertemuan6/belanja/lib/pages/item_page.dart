import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Catch the arguments passed from Navigator.pushNamed
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'item_image_${itemArgs.name}', // Must match the tag in HomePage
              child: Image.network(
                itemArgs.imageUrl,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(itemArgs.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 28),
                          Text('${itemArgs.rating}', style: const TextStyle(fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Rp ${itemArgs.price}', style: const TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Stock Available: ${itemArgs.stock}', style: const TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 24),
                  const Text('Product Description', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'This is a high-quality product perfect for your daily needs. Sourced from the best materials and delivered straight to your door. Grab it while stocks last!', 
                    style: TextStyle(fontSize: 16, height: 1.5)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}