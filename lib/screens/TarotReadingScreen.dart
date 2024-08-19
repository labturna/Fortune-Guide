import 'dart:math';
import 'package:flutter/material.dart';
import 'TarotHoroscope.dart';
import 'Profile.dart';
class TarotReadingScreen extends StatefulWidget {
  const TarotReadingScreen({super.key});

  @override
  _TarotReadingScreenState createState() => _TarotReadingScreenState();
}

class _TarotReadingScreenState extends State<TarotReadingScreen> with SingleTickerProviderStateMixin {
  String _selectedSpread = '3'; // Default to 3-card spread
  final TextEditingController _questionController = TextEditingController();
  List<String> _selectedCards = []; // Seçilen kartların listesi
  final List<String> _deck = List.generate(78, (index) => 'Card ${index + 1}'); // Kartları temsil eden liste
  late AnimationController _animationController; // Animasyon kontrolörü

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _shuffleDeck() {
    // Kart destesini karıştır ve rastgele kartları seç
    setState(() {
      _selectedCards.clear(); // Önceki seçimi temizle
      int spreadCount = int.parse(_selectedSpread);
      Random random = Random();
      List<String> shuffledDeck = List.from(_deck)..shuffle(random);
      _selectedCards = shuffledDeck.take(spreadCount).toList();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: SizedBox(
          width: 150, // İstediğiniz genişlikte ayarlayın
          child: Text("Deck shuffled! Selected cards revealed."),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(left: 30, right: 30), // Yukarıdan boşluk bırak
      ),
    );

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Transparan arka plan
        elevation: 0, // Gölgeyi kaldır
        actions: [
          IconButton(
            icon: Image.asset('assets/images/tarot-orange.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TarotCardScreen()),
              );
            },
          ),
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
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // İçeriği kaydırılabilir hale getir
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Card(
                elevation: 10,
                color: Colors.white.withOpacity(0.2), // Card arka plan rengini ayarla
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _questionController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Type your question here',
                          hintStyle: TextStyle(color: Colors.white70), // Placeholder rengini beyaz yaptım
                        ),
                        style: const TextStyle(color: Colors.white), // Yazı rengini beyaz yaptım
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Choose Spread:",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // Yazı rengini beyaz yaptım
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: '3',
                            groupValue: _selectedSpread,
                            onChanged: (value) {
                              setState(() {
                                _selectedSpread = value!;
                                _selectedCards = []; // Seçilen kartları sıfırla
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                          const Text('3 Cards', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                          Radio<String>(
                            value: '5',
                            groupValue: _selectedSpread,
                            onChanged: (value) {
                              setState(() {
                                _selectedSpread = value!;
                                _selectedCards = []; // Seçilen kartları sıfırla
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                          const Text('5 Cards', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                          Radio<String>(
                            value: '7',
                            groupValue: _selectedSpread,
                            onChanged: (value) {
                              setState(() {
                                _selectedSpread = value!;
                                _selectedCards = []; // Seçilen kartları sıfırla
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                          const Text('7 Cards', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Select Your Cards:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _deck.length,
                physics: const NeverScrollableScrollPhysics(), // GridView kaydırılamaz
                shrinkWrap: true, // GridView'in boyutunu sınırlamak için
                itemBuilder: (context, index) {
                  String card = _deck[index];
                  bool isSelected = _selectedCards.contains(card);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!isSelected && _selectedCards.length < int.parse(_selectedSpread)) {
                          _selectedCards.add(card);
                        } else if (isSelected) {
                          _selectedCards.remove(card);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: isSelected ? Colors.orange : Colors.black),
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/card-back.jpg'), // Kapalı kart resmi
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: (_selectedCards.length == int.parse(_selectedSpread))
          ? Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent, // Butonun arka planını şeffaf yap
          onPressed: () {
            // Send butonuna tıklandığında yapılacaklar
          },
          tooltip: 'Send',
          child: const Icon(Icons.send, color: Colors.white),
        ),
      )
          : Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.yellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent, // Butonun arka planını şeffaf yap
          onPressed: _shuffleDeck,
          tooltip: 'Shuffle Deck',
          child: const Icon(Icons.shuffle, color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: false, // Klavye açıldığında yeniden boyutlandırmayı önle
    );
  }
}
