import 'package:flutter/material.dart';
import '../models/tour_package.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<TourPackage> packages = [
    TourPackage(
      id: '1',
      title: 'Pesona Raja Ampat, Papua',
      description: 'Nikmati keindahan bawah laut terbaik dunia dan gugusan pulau karang yang memukau.',
      price: 4500000,
      imageUrl: 'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?q=80&w=600&auto=format&fit=crop',
    ),
    TourPackage(
      id: '2',
      title: 'Sunrise Bromo, Jawa Timur',
      description: 'Saksikan matahari terbit yang spektakuler dari penanjakan Gunung Bromo.',
      price: 1200000,
      imageUrl: 'https://images.unsplash.com/photo-1588668214408-94a93b9b50dc?q=80&w=600&auto=format&fit=crop',
    ),
    TourPackage(
      id: '3',
      title: 'Ubud & Tanah Lot, Bali',
      description: 'Rasakan ketenangan alam Ubud dan keindahan matahari terbenam di Pura Tanah Lot.',
      price: 2500000,
      imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=600&auto=format&fit=crop',
    ),
    TourPackage(
      id: '4',
      title: 'Labuan Bajo, Nusa Tenggara Timur',
      description: 'Berlayar dengan kapal Phinisi dan temui komodo secara langsung di habitat aslinya.',
      price: 3800000,
      imageUrl: 'https://images.unsplash.com/photo-1578328819058-b69f3a3b0f6b?q=80&w=600&auto=format&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NusaTravel Explorer'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // Logout dengan menghapus seluruh riwayat halaman sebelumnya
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.splash,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                // Menuju Detail Screen menggunakan pushNamed dengan membawa argument
                Navigator.pushNamed(
                  context,
                  AppRoutes.detail,
                  arguments: package,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    package.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          package.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          package.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp ${package.price.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade800,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}