import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: 'BankGothic',
              color: Colors.white70),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover, // Arka plan resmi tam olarak kaplasın
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0), // İçerik için boşluk
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kullanıcı Bilgileri Kartı
                _buildUserInfoCard(),
                const SizedBox(height: 20),

                // Kullanıcının Kazandığı Badgeler
                _buildBadgeSection(),
                const SizedBox(height: 20),

                // Fal Kartları Bölümü
                const Text(
                  'Your Fortune',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCard('Health', Icons.health_and_safety),
                    const SizedBox(width: 10), // Kartlar arasında boşluk
                    _buildCard('Finance', Icons.monetization_on),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCard('Love', Icons.favorite),
                    const SizedBox(width: 10), // Kartlar arasında boşluk
                    _buildCard('Work', Icons.work),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Kullanıcı Bilgileri Kartı
  Widget _buildUserInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white70.withOpacity(0.5), // Glassmorphism efekti
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.white),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text('example@example.com', style: TextStyle(color: Colors.white)),
                          ),
                        ],
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
  }

  // Kullanıcının Kazandığı Badgeleri Gösteren Bölüm
  Widget _buildBadgeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Owned NFTs',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: [
            _buildBadge('assets/nfts/nft1.jpg'), // İlk badge
            _buildBadge('assets/nfts/nft2.jpg'), // İkinci badge
            _buildBadge('assets/nfts/nft3.jpg'), // Üçüncü badge
            // Daha fazla badge eklemek için buraya ekleyebilirsin
          ],
        ),
      ],
    );
  }

  // Badge Widget'ı
  Widget _buildBadge(String imagePath) {
    return RotationBadge(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  // Fal Kartı Widget'ı
  Widget _buildCard(String title, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3), // Glassmorphism efekti
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.orange),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotationBadge extends StatefulWidget {
  final Widget child;

  const RotationBadge({super.key, required this.child});

  @override
  _RotationBadgeState createState() => _RotationBadgeState();
}

class _RotationBadgeState extends State<RotationBadge> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8),
                    width: 3,
                  ),
                ),
              ),
            ),
            widget.child,
          ],
        );
      },
    );
  }
}
