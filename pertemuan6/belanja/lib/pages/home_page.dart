import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, imageUrl: 'https://picsum.photos/200?random=1', stock: 10, rating: 4.5),
    Item(name: 'Salt', price: 2000, imageUrl: 'https://picsum.photos/200?random=2', stock: 25, rating: 4.8),
    Item(name: 'Coffee', price: 15000, imageUrl: 'https://picsum.photos/200?random=3', stock: 5, rating: 4.9),
    Item(name: 'Tea', price: 8000, imageUrl: 'https://picsum.photos/200?random=4', stock: 12, rating: 4.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belanja App'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7, // Adjusts height of the grid cards
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'item_image_${item.name}',
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            item.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Rp ${item.price}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Stock: ${item.stock}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              Row(
                                children: [
                                  const Icon(Icons.star, size: 14, color: Colors.orange),
                                  Text('${item.rating}', style: const TextStyle(fontSize: 12)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blueAccent,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Rifat Djibran | 244107060138',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}