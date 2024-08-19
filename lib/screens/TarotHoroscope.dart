import 'package:flutter/material.dart';
import 'dart:ui';

class TarotCardScreen extends StatefulWidget {
  const TarotCardScreen({super.key});

  @override
  _TarotCardScreenState createState() => _TarotCardScreenState();
}

class _TarotCardScreenState extends State<TarotCardScreen> {
  final List<Map<String, String>> tarotCards = [
    // Büyük Arcana
    {'name': 'The Fool', 'image': 'assets/images/00_Fool.jpg', 'type': 'major'},
    {'name': 'The Magician', 'image': 'assets/images/01_Magician.jpg', 'type': 'major'},
    {'name': 'The High Priestess', 'image': 'assets/images/02_High_Priestess.jpg', 'type': 'major'},
    {'name': 'The Empress', 'image': 'assets/images/03_Empress.jpg', 'type': 'major'},
    {'name': 'The Emperor', 'image': 'assets/images/04_Emperor.jpg', 'type': 'major'},
    {'name': 'The Hierophant', 'image': 'assets/images/05_Hierophant.jpg', 'type': 'major'},
    {'name': 'The Lovers', 'image': 'assets/images/06_Lovers.jpg', 'type': 'major'},
    {'name': 'The Chariot', 'image': 'assets/images/07_Chariot.jpg', 'type': 'major'},
    {'name': 'Strength', 'image': 'assets/images/08_Strength.jpg', 'type': 'major'},
    {'name': 'The Hermit', 'image': 'assets/images/09_Hermit.jpg', 'type': 'major'},
    {'name': 'Wheel of Fortune', 'image': 'assets/images/10_Wheel_of_Fortune.jpg', 'type': 'major'},
    {'name': 'Justice', 'image': 'assets/images/11_Justice.jpg', 'type': 'major'},
    {'name': 'The Hanged Man', 'image': 'assets/images/12_Hanged_Man.jpg', 'type': 'major'},
    {'name': 'Death', 'image': 'assets/images/13_Death.jpg', 'type': 'major'},
    {'name': 'Temperance', 'image': 'assets/images/14_Temperance.jpg', 'type': 'major'},
    {'name': 'The Devil', 'image': 'assets/images/15_Devil.jpg', 'type': 'major'},
    {'name': 'The Tower', 'image': 'assets/images/16_Tower.jpg', 'type': 'major'},
    {'name': 'The Star', 'image': 'assets/images/17_Star.jpg', 'type': 'major'},
    {'name': 'The Moon', 'image': 'assets/images/18_Moon.jpg', 'type': 'major'},
    {'name': 'The Sun', 'image': 'assets/images/19_Sun.jpg', 'type': 'major'},
    {'name': 'Judgment', 'image': 'assets/images/20_Judgement.jpg', 'type': 'major'},
    {'name': 'The World', 'image': 'assets/images/21_World.jpg', 'type': 'major'},
    // Küçük Kartlar (Değnek)
    {'name': 'Ace of Wands', 'image': 'assets/images/22_Ace_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Two of Wands', 'image': 'assets/images/23_Two_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Three of Wands', 'image': 'assets/images/24_Three_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Four of Wands', 'image': 'assets/images/25_Four_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Five of Wands', 'image': 'assets/images/26_Five_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Six of Wands', 'image': 'assets/images/27_Six_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Seven of Wands', 'image': 'assets/images/28_Seven_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Eight of Wands', 'image': 'assets/images/29_Eight_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Nine of Wands', 'image': 'assets/images/30_Nine_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Ten of Wands', 'image': 'assets/images/31_Ten_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Page of Wands', 'image': 'assets/images/32_Page_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Knight of Wands', 'image': 'assets/images/33_Knight_of_Wands.jpg', 'type': 'wands'},
    {'name': 'Queen of Wands', 'image': 'assets/images/34_Queen_of_Wands.jpg', 'type': 'wands'},
    {'name': 'King of Wands', 'image': 'assets/images/35_King_of_Wands.jpg', 'type': 'wands'},
    // Küçük Kartlar (Pentacle)
    {'name': 'Ace of Pentacles', 'image': 'assets/images/36_Ace_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Two of Pentacles', 'image': 'assets/images/37_Two_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Three of Pentacles', 'image': 'assets/images/38_Three_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Four of Pentacles', 'image': 'assets/images/39_Four_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Five of Pentacles', 'image': 'assets/images/40_Five_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Six of Pentacles', 'image': 'assets/images/41_Six_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Seven of Pentacles', 'image': 'assets/images/42_Seven_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Eight of Pentacles', 'image': 'assets/images/43_Eight_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Nine of Pentacles', 'image': 'assets/images/44_Nine_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Ten of Pentacles', 'image': 'assets/images/45_Ten_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Page of Pentacles', 'image': 'assets/images/46_Page_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Knight of Pentacles', 'image': 'assets/images/47_Knight_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'Queen of Pentacles', 'image': 'assets/images/48_Queen_of_Pentacles.jpg', 'type': 'pentacles'},
    {'name': 'King of Pentacles', 'image': 'assets/images/49_King_of_Pentacles.jpg', 'type': 'pentacles'},
    // Küçük Kartlar (Kupa)
    {'name': 'Ace of Cups', 'image': 'assets/images/50_Ace_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Two of Cups', 'image': 'assets/images/51_Two_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Three of Cups', 'image': 'assets/images/52_Three_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Four of Cups', 'image': 'assets/images/53_Four_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Five of Cups', 'image': 'assets/images/54_Five_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Six of Cups', 'image': 'assets/images/55_Six_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Seven of Cups', 'image': 'assets/images/56_Seven_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Eight of Cups', 'image': 'assets/images/57_Eight_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Nine of Cups', 'image': 'assets/images/58_Nine_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Ten of Cups', 'image': 'assets/images/59_Ten_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Page of Cups', 'image': 'assets/images/60_Page_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Knight of Cups', 'image': 'assets/images/61_Knight_of_Cups.jpg', 'type': 'cups'},
    {'name': 'Queen of Cups', 'image': 'assets/images/62_Queen_of_Cups.jpg', 'type': 'cups'},
    {'name': 'King of Cups', 'image': 'assets/images/63_King_of_Cups.jpg', 'type': 'cups'},
    // Küçük Kartlar (Kılıç)
    {'name': 'Ace of Swords', 'image': 'assets/images/64_Ace_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Two of Swords', 'image': 'assets/images/65_Two_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Three of Swords', 'image': 'assets/images/66_Three_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Four of Swords', 'image': 'assets/images/67_Four_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Five of Swords', 'image': 'assets/images/68_Five_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Six of Swords', 'image': 'assets/images/69_Six_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Seven of Swords', 'image': 'assets/images/70_Seven_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Eight of Swords', 'image': 'assets/images/71_Eight_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Nine of Swords', 'image': 'assets/images/72_Nine_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Ten of Swords', 'image': 'assets/images/73_Ten_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Page of Swords', 'image': 'assets/images/74_Page_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Knight of Swords', 'image': 'assets/images/75_Knight_of_Swords.jpg', 'type': 'swords'},
    {'name': 'Queen of Swords', 'image': 'assets/images/76_Queen_of_Swords.jpg', 'type': 'swords'},
    {'name': 'King of Swords', 'image': 'assets/images/77_King_of_Swords.jpg', 'type': 'swords'},
  ];

  List<Map<String, String>> filteredCards = [];

  @override
  void initState() {
    super.initState();
    filteredCards = List.from(tarotCards);
  }

  void filterCards(String type) {
    setState(() {
      if (type == 'all') {
        filteredCards = List.from(tarotCards); // Tüm kartları göster
      } else {
        filteredCards = tarotCards.where((card) => card['type'] == type).toList(); // Belirli türdeki kartları filtrele
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0, // Gölgeyi kaldır
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white70, // Geri ikonunun rengini beyaz yap
          onPressed: () {
            Navigator.pop(context); // Geri git
          },
        ),
        title: const Text(
          "Tarot Horoscope",
          style: TextStyle(fontFamily: 'BankGothic',
          color: Colors.white70),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // Arka plan resmi
            fit: BoxFit.cover, // Resmi kapsamak için
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0), // Üst ve alt boşluk ekle
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton('assets/images/major_arcana.png', 'major'),
                  _buildIconButton('assets/images/wands.png', 'wands'),
                  _buildIconButton('assets/images/cups.png', 'cups'),
                  _buildIconButton('assets/images/swords.png', 'swords'),
                  _buildIconButton('assets/images/pentacles.png', 'pentacles'),
                  _buildIconButton('assets/images/all.png', 'all'), // Tüm kartları göstermek için bir ikon ekleyin
                ],
              ),
            ),
            // Kartlar
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: filteredCards.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Kart seçildiğinde gösterilecek sayfa
                      _showCardDetail(context, filteredCards[index]['name']!, filteredCards[index]['image']!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Yarı saydam arka plan
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Bulanıklaştırma efekti
                          child: Column(
                            children: [
                              Image.asset(
                                filteredCards[index]['image']!,
                                fit: BoxFit.cover,
                                height: 120,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                filteredCards[index]['name']!,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetPath, String filterType) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.yellow, // Başlangıç rengi
            Colors.deepOrange, // Bitiş rengi
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle, // İkonu dairesel yapmak için
      ),
      child: IconButton(
        icon: Image.asset(
          assetPath,
          width: 30,
          height: 30,
        ),
        onPressed: () => filterCards(filterType),
      ),
    );
  }

  void _showCardDetail(BuildContext context, String cardName, String cardImage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(cardName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(cardImage),
              const SizedBox(height: 16),
              const Text("Bu kartın anlamı..."),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
