import 'package:flutter/material.dart';
import 'dart:ui'; // ImageFilter için
import 'Profile.dart';

class HoroscopeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> horoscopes = [
    {'name': 'Aries', 'gif': 'assets/gifs/aries.gif', 'prediction': 'You will feel energetic today.'},
    {'name': 'Taurus', 'gif': 'assets/gifs/taurus.gif', 'prediction': 'Be patient, good opportunities are on the way.'},
    {'name': 'Gemini', 'gif': 'assets/gifs/gemini.gif', 'prediction': 'You can strengthen your social relationships.'},
    {'name': 'Cancer', 'gif': 'assets/gifs/cancer.gif', 'prediction': 'Value your family bonds.'},
    {'name': 'Leo', 'gif': 'assets/gifs/leo.gif', 'prediction': 'Believe in yourself, opportunities are waiting for you.'},
    {'name': 'Virgo', 'gif': 'assets/gifs/virgo.gif', 'prediction': 'You should pay attention to details.'},
    {'name': 'Libra', 'gif': 'assets/gifs/libra.gif', 'prediction': 'Try to stay balanced.'},
    {'name': 'Scorpio', 'gif': 'assets/gifs/scorpio.gif', 'prediction': 'Prefer to keep things secret.'},
    {'name': 'Sagittarius', 'gif': 'assets/gifs/sagittarius.gif', 'prediction': 'You may embark on new adventures.'},
    {'name': 'Capricorn', 'gif': 'assets/gifs/capricorn.gif', 'prediction': 'Focus on your goals.'},
    {'name': 'Aquarius', 'gif': 'assets/gifs/aquarius.gif', 'prediction': 'You can attract attention with your innovative ideas.'},
    {'name': 'Pisces', 'gif': 'assets/gifs/pisces.gif', 'prediction': 'Pay attention to your feelings.'},
  ];

  HoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0, // AppBar'ın gölgesini kaldır
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.deepOrange,
            onPressed: () {
              // Bildirim simgesine tıklanınca yapılacaklar
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.deepOrange,
            onPressed: () {
              // Profil simgesine tıklanınca ProfilePage'e git
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // Arka plan resmi
            fit: BoxFit.cover, // Resmi kapsamak için
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: horoscopes.length,
            itemBuilder: (context, index) {
              return GlassmorphicCard(
                name: horoscopes[index]['name']!,
                gif: horoscopes[index]['gif']!,
                prediction: horoscopes[index]['prediction']!,
              );
            },
          ),
        ),
      ),
    );
  }
}

class GlassmorphicCard extends StatelessWidget {
  final String name;
  final String gif; // GIF dosyası için String
  final String prediction;

  const GlassmorphicCard({
    super.key,
    required this.name,
    required this.gif,
    required this.prediction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0), // Kartlar arası boşluk
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Yüksekliği ortalar
              children: [
                // GIF'i daire içine al
                Tooltip(
                  message: name, // Burç adı tooltip olarak gösterilecek
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: Colors.white.withOpacity(0.4), width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        gif,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Center(
                    child: Text(
                      prediction,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'Montserrat-Light', // Font değişimi
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
