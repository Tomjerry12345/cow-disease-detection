import 'package:cow_predict/components/header/header_component.dart';
import 'package:flutter/material.dart';

class TentangScreen extends StatelessWidget {
  const TentangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderComponent(
        title: "Tentang",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tentang Aplikasi Cow Predict",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.white,
              elevation: 4, // Memberikan efek bayangan pada kartu
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Membuat sudut kartu melengkung
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Aplikasi ini dirancang untuk membantu peternak dalam mengidentifikasi penyakit pada sapi secara cepat dan akurat. "
                  "Dengan memanfaatkan teknologi terkini, aplikasi ini dapat menganalisis gejala yang dimasukkan pengguna dan memberikan informasi tentang penyakit yang mungkin dialami sapi.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
