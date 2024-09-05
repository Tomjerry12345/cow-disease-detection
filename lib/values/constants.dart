import 'package:flutter/material.dart';

Color? primaryColor = Colors.green[800];
Color? secondaryColor = Colors.green[500];
const bgColor = Color(0xFF212332);
const white = Colors.white;

const tabActivateColor = Color.fromARGB(255, 35, 38, 52);
const tabNotactivateColor = Color.fromARGB(255, 68, 74, 101);

const defaultPadding = 16.0;

const KEY_ISLOGGING = "is-logging";

const BASE_URL = "http://10.0.2.2:5000";

// ignore: constant_identifier_names
const PENGOBATAN = {
  "Balisecta":
      "Penyuntikan Penecilin, Vitamin B.compleks, Pengolesan salep pada tubuh",
  "Anoreksia": "penyuntikan vitamin, B compleks",
  "Cacingan": "VERM-O BOLUS",
  "Flu": "Penyuntikan Vetoxy-LA, Vitamin Injectamin",
  "Infeksi saluran pencernaan": "Antibiotik (Colibact)",
  "Influensa": "Vitamin (B-Com)",
  "Jembrana": "INJEKSI VITAMIN B KOMPLEKS",
  "Distokia": "Antibiotik (Colibact), Vitamin (Vitol)",
  "BEF": "",
  "Infeksi pernapasan atas": "",
  "Flu akut (kondisi parah)":
      "Antybiotik (Vetoxy LA), Vitamin (Injektamin B12)",
  "Diare": "Antibiotik (Colibact), Vitamin (Injektamin B12)",
  "Luka pada bagian kaki": "Vitamin (B-Com), Analgesik (Sulphidon)",
  "Tympani": "Tympanol",
  "Radang  bagian mulut": "Vitamin (B-Com), Sulphidon, Medoxy-L",
  "Scabies": " IVOMEC INJECTION",
  "PMK": "",
  "Malnutrisi": "MULTIVITAMIN B COMPLEX",
  "Avitaminosis": "INJECTAMIN",
  "Abses": "MEDOXY LA",
  "Katarak": "Antibiotik (Vetoxy)",
  "Penyakit E Coli/colibacilosis": "Vitamin (B-Com), Colibact",
  // "Malnutrisi": "",
  "Ascariasis": " VERM-O BOLUS",
  "radang paha": " BIODIN",
  "Thelaziasis": "VET-OXY LA",
  "Radang mata": "VET-OXY LA",
  "keguguran": "MULTIVITAMIN B COMPLEX",
  " Bovine Viral Diarrhea": "",
  "Konjunctivitis": "MEDOXY LA",
  "Keracunan": "Tympanol",
  "Kekurangan Calsium": " CALCIJECT 40 CM",
  "Enteritis": "MEDOXY LA",
  "Mata Putih": "VERM-O BOLUS",
};
