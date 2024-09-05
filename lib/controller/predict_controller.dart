import 'package:cow_predict/values/constants.dart';
import 'package:cow_predict/values/output_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictController extends GetxController {
  var checkedGejala = <String, bool>{}.obs;
  var gejalaValues = <int>[].obs;
  var searchQuery = ''.obs;

  final GlobalKey<FormFieldState> keyDropdown = GlobalKey<FormFieldState>();

  // Daftar gejala
  final List<String> listGejala = [
    "Kekurusan",
    "Penurunan berat badan",
    "Bulu kusam",
    "Kulit kering dan bersisik",
    "Mata berair",
    "Lesu atau kurangnya energi",
    "Lemah",
    "Diare",
    "Penurunan produksi susu",
    "Mata merah dan bengkak",
    "Lendir atau nanah yang keluar dari mata",
    "Sensitivitas terhadap Cahaya",
    "Sering menggosok mata",
    "Kembung",
    "Sulit bernapas",
    "Gelisah",
    "Gatal",
    "Lesi kulit berupa kerak",
    "Kerontokan bulu diera seperti (kepala, leher dan kaki)",
    "Mencret",
    "Penurunan nafsu makan",
    "Kulit kering",
    "Mata cekung",
    "Demam",
    "Kejang atau kelemahan otot",
    "Gangguan pernapasan",
    "Sulit berdiri",
    "Penurunan penglihatan",
    "Kornea tampak warna putih atau buram",
    "Peradangan atau pembengkakan disekitar mata",
    "Pembengkakan dan kemerahan disekitar mulut dan lidah",
    "Pembengkakan pada kelenjar getah bening",
    "Ambruk",
    "Otot gemetaran",
    "Berbaring atau sulit untuk bangun",
    "Perut kembung",
    "Pernapasan lambat",
    "Kelainan mata",
    "Bola mata besar/bengkak",
    "Mencret berdarah",
    "Lesi pada mukosa mulut dan hidung",
    "Depresi",
    "Kemerahan dan pembengkakan",
    "Air mata berlebihan",
    "Nyeri dan iritasi",
    "Keluarnya cairan yang tidak normal dari vagina",
    "Pincang",
    "Luka terbuka",
    "Patah tulang",
    "Pendarahan",
    "Mata terlihat merah dan meradang",
    "Pembengkakan disekitar mata",
    "Kotoran mata",
    "Penglihatan terganggu",
    "Kaki tidak normal",
    "Cedera",
    "Infeksi kulit",
    "Menyebabkan bengkak dan nyeri",
    "Pembengkakan dibawah rahang",
    "Flu",
    "Kulit yang kering dan kasar",
    "Hipersalifasi",
    "Spot pada lidah dan gusi",
    "Mata sayup",
    "Lumpuh",
    "Kekurangan mineral",
    "Luka pada kuku kaki",
    "Terdapat keropeng pada kulit",
    "Bulu rontok",
    "Lesi pada kulit",
    "Gatal-gatal",
    "Air seni berwarna kuning",
    "Mengigit badan sampai terkelupas",
    "Badan lesu",
    "Kurus",
    "Feses sangat encer",
    "Bau tengik dan malas makan",
    "Kulit terkelupas",
    "Lendir pada hidung",
    "Kurang nafsu makan dan minum",
    "Perut kembung habis melahirkan",
    "Air liur berlebihan",
    "Feses susah keluar dan agak keras",
    "Luka pada bagian kaki",
    "Beringus",
    "Feses kering keras dan bercampur lender",
    "Pakan yang dicerna dimulut keluar Bersama lender dihidung",
    "Fisik lemah",
    "Bola mata agak berwarna putih",
    "Posisi janin yang tidak normal",
    "Pembengkakan vulva",
    "Batuk flu",
    "Bulu berdiri",
    "Feses berbau tengik",
    "Susah berdiri",
    "Kurus dan mukosa pucat",
    "Membantu melahirkan"
  ];

  @override
  void onInit() {
    super.onInit();
    reset();
  }

  void reset() {
    // Reset checkedGejala
    checkedGejala.clear();
    for (var gejala in listGejala) {
      checkedGejala[gejala] = false;
    }

    // Reset gejalaValues
    gejalaValues.clear();
    for (var i = 0; i < listGejala.length; i++) {
      gejalaValues.add(0);
    }

    keyDropdown.currentState?.reset();
  }

  List<String> get filteredGejala {
    if (searchQuery.value.isEmpty) {
      return listGejala;
    } else {
      return listGejala
          .where((gejala) =>
              gejala.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  String generateVariableName(int index) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (index < 26) {
      return alphabet[index];
    } else {
      final firstLetterIndex = (index - 26) ~/ 26;
      final secondLetterIndex = (index - 26) % 26;
      return '${alphabet[firstLetterIndex]}${alphabet[secondLetterIndex]}';
    }
  }

  void toggleCheckbox(String gejala, bool? value) {
    checkedGejala[gejala] = value ?? false;

    int index = listGejala.indexOf(gejala);
    gejalaValues[index] = value == true ? 1 : 0;

    logO("gejalaValues", m: gejalaValues);
  }

  Future<String> predict() async {
    final url = Uri.parse("$BASE_URL/predict");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'features': gejalaValues}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['prediction'];
    } else {
      throw Exception('Failed to load prediction');
    }
  }
}
