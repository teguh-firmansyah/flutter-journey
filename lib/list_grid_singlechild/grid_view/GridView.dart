import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  final List<Map<String, dynamic>> produk = const [
    {'nama': 'Laptop', 'harga': 8500000, 'icon': Icons.laptop_mac},
    {'nama': 'Keyboard', 'harga': 350000, 'icon': Icons.keyboard},
    {'nama': 'Mouse', 'harga': 150000, 'icon': Icons.mouse},
    {'nama': 'Headset', 'harga': 450000, 'icon': Icons.headphones},
    {'nama': 'Monitor', 'harga': 2200000, 'icon': Icons.monitor},
    {'nama': 'Webcam', 'harga': 300000, 'icon': Icons.videocam},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: produk.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = produk[index];

        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              debugPrint('Produk dipilih: ${item['nama']}');
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Icon(
                        item['icon'] as IconData,
                        size: 64,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Text(
                    item['nama'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp ${item['harga']}',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
