import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // JSON verilerini kullanmak için
import 'dart:io'; // File sınıfını kullanmak için
import 'Profile.dart';
class CoffeeFortuneScreen extends StatefulWidget {
  const CoffeeFortuneScreen({super.key});

  @override
  _CoffeeFortuneScreenState createState() => _CoffeeFortuneScreenState();
}

class _CoffeeFortuneScreenState extends State<CoffeeFortuneScreen> {
  final String coffeeImagePath = 'assets/images/fortuneteller.png';
  File? _selectedImage;
  String? _fortuneText; // Kahve yorumunu saklamak için

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.1), // Şeffaf arka plan
                border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5), // Shadow'un konumu
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Image.asset(coffeeImagePath, fit: BoxFit.cover),
                    const SizedBox(height: 10),
                    const Text(
                      "Mystic Anna", // Falcı ismi
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Discover your future with a cup of coffee!", // Slogan
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedImage != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    _selectedImage!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showImageSourceDialog();
              },
              child: const Text(
                "Send your Turkish Coffee",
                style: TextStyle(fontFamily: 'Montserrat-Light', fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            // Yorum metnini göster
            if (_fortuneText != null)
              Text(
                _fortuneText!,
                style: const TextStyle(fontFamily: "Montserrat-Light", fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose Image Source"),
          actions: [
            TextButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      _sendImageToBackend(pickedFile.path);
    }
  }

  Future<void> _sendImageToBackend(String imagePath) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('YOUR_BACKEND_URL'), // Backend URL
    );

    request.files.add(await http.MultipartFile.fromPath('file', imagePath));

    try {
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final data = json.decode(responseData.body);
        setState(() {
          _fortuneText = data['fortune']; // Backend'den gelen kahve yorumu
        });
      } else {
        // Hata durumunu yönet
        setState(() {
          _fortuneText = "An error occurred. Please try again.";
        });
      }
    } catch (e) {
      setState(() {
        _fortuneText = "An error occurred. Please try again.";
      });
    }
  }
}
