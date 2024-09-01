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
              "Tentang Aplikasi Sistem Deteksi Penyakit Ternak",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Aplikasi Sistem Deteksi Penyakit Ternak adalah solusi inovatif yang dirancang untuk membantu peternak dalam mendeteksi dan mendiagnosis penyakit pada ternak mereka secara lebih efisien. Dengan menggunakan teknologi terkini dan metode berbasis data, aplikasi ini menawarkan berbagai fitur untuk memastikan kesehatan dan kesejahteraan ternak Anda.\n\n"
              "Fitur utama dari aplikasi ini meliputi:\n"
              "1. **Deteksi Gejala:** Aplikasi ini memungkinkan pengguna untuk memilih gejala yang terlihat pada ternak. Berdasarkan input tersebut, sistem akan memberikan prediksi kemungkinan penyakit yang dapat dialami ternak.\n\n"
              "2. **Prediksi Penyakit:** Menggunakan algoritma canggih dan data historis, aplikasi ini memberikan prediksi tentang penyakit yang mungkin dihadapi ternak. Ini membantu peternak dalam mengambil tindakan pencegahan atau perawatan yang tepat.\n\n"
              "3. **Pengobatan:** Aplikasi ini memberikan rekomendasi pengobatan yang sesuai berdasarkan penyakit yang terdeteksi. Informasi ini membantu peternak dalam memberikan perawatan yang lebih efektif kepada ternak mereka.\n\n"
              "4. **Data dan Statistik:** Dengan fitur ini, peternak dapat melacak dan menganalisis data kesehatan ternak mereka dari waktu ke waktu. Statistik ini memberikan wawasan yang berharga tentang tren kesehatan ternak dan membantu dalam pengambilan keputusan yang lebih baik.\n\n"
              "Aplikasi ini bertujuan untuk meningkatkan kualitas hidup ternak dan mengurangi kerugian yang disebabkan oleh penyakit. Dengan antarmuka yang ramah pengguna dan teknologi yang andal, aplikasi ini adalah alat penting bagi setiap peternak yang ingin menjaga kesehatan ternak mereka dengan lebih baik.\n\n"
              "Kami terus berupaya untuk memperbarui dan meningkatkan aplikasi ini agar tetap relevan dan bermanfaat bagi semua pengguna. Terima kasih telah menggunakan Aplikasi Sistem Deteksi Penyakit Ternak.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
