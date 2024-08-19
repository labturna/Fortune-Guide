import 'package:flutter/material.dart';

class NftCardScreen extends StatelessWidget {
  const NftCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "NFT Gallery",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.6,
          ),
          itemCount: 3, // Örnek NFT sayısı
          itemBuilder: (context, index) {
            return _buildNftCard(
              context,
              'assets/nfts/nft${index + 1}.jpg', // NFT görseli
              '${(index + 1) * 10} XRP', // Fiyat bilgisi
            );
          },
        ),
      ),
    );
  }

  Widget _buildNftCard(BuildContext context, String nftImage, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(nftImage),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Buy butonuna tıklandığında yapılacak işlemler
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // 'primary' yerine 'backgroundColor' kullanıldı
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                ),
                child: const Text(
                  'Buy',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
