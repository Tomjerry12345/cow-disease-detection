// ignore_for_file: use_build_context_synchronously

import 'package:cow_predict/components/button/button_component.dart';
import 'package:cow_predict/components/header/header_component.dart';
import 'package:cow_predict/components/text/text_component.dart';
import 'package:cow_predict/components/textfield/dropdown_component.dart';
import 'package:cow_predict/components/textfield/textfield_component.dart';
import 'package:cow_predict/controller/predict_controller.dart';
import 'package:cow_predict/values/dialog_utils.dart';
import 'package:cow_predict/values/output_utils.dart';
import 'package:cow_predict/values/position_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PredictScreen extends StatelessWidget {
  const PredictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PredictController controller = Get.put(PredictController());
    final usiaController = TextEditingController();
    final jenisKelaminController = TextEditingController();
    final lokasiController = TextEditingController();

    void reset() {
      usiaController.text = "";
      jenisKelaminController.text = "";
      lokasiController.text = "";

      controller.reset();
    }

    return Scaffold(
        appBar: const HeaderComponent(
          title: "Prediksi",
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextComponent(
                      "Usia :",
                      size: 18,
                    ),
                    H(16),
                    Expanded(
                        child: TextfieldComponent(
                      controller: usiaController,
                      radius: 8,
                    ))
                  ],
                ),
                V(16),
                Row(
                  children: [
                    TextComponent(
                      "Jenis kelamin :",
                      size: 18,
                    ),
                    H(16),
                    Expanded(
                      child: DropdownComponent(
                        items: ["Jantan", "Betina"],
                        onSelectedItems: (value) {
                          jenisKelaminController.text = value;
                        },
                      ),
                    )
                  ],
                ),
                V(16),
                Row(
                  children: [
                    TextComponent(
                      "Lokasi :",
                      size: 18,
                    ),
                    H(16),
                    Expanded(
                        child: TextfieldComponent(
                      controller: lokasiController,
                      radius: 8,
                    ))
                  ],
                ),
                V(16),
                TextComponent(
                  "Pilih gejala",
                  size: 18,
                ),
                V(8),
                // Memastikan Obx digunakan dengan benar
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.checkedGejala.length,
                      itemBuilder: (context, index) {
                        String symptom = controller.listGejala[index];
                        String abjad = controller.generateVariableName(index);
                        return CheckboxListTile(
                          side: const BorderSide(color: Colors.green),
                          title: Text("$symptom ($abjad)"),
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green),
                          value: controller.checkedGejala[symptom] ?? false,
                          onChanged: (bool? value) {
                            controller.toggleCheckbox(symptom, value);
                          },
                        );
                      },
                    );
                  }),
                ),
                V(24),
                Center(
                    child: Container(
                        width: 200,
                        child: ButtonComponent("Prediksi", onPressed: () async {
                          try {
                            final usia = usiaController.text;
                            final jenisKelamin = jenisKelaminController.text;
                            final lokasi = lokasiController.text;

                            // Cek jika ada gejala yang dipilih
                            final selectedSymptoms = controller.listGejala
                                .where((gejala) =>
                                    controller.checkedGejala[gejala] == true)
                                .toList();

                            if (usia.isEmpty ||
                                jenisKelamin.isEmpty ||
                                lokasi.isEmpty) {
                              showSnackbar(
                                "Error",
                                "Input tidak boleh kosong",
                                StatusSnackbar.error,
                              );
                              return;
                            } else if (selectedSymptoms.isEmpty) {
                              showSnackbar(
                                "Error",
                                "Anda harus memilih setidaknya satu gejala",
                                StatusSnackbar.error,
                              );
                              return;
                            }

                            String prediction = await controller.predict();
                            dialogShow(
                              context: context,
                              content: SizedBox(
                                width: 300,
                                child: Column(
                                  children: [
                                    const TextComponent("Hasil prediksi"),
                                    V(24),
                                    RowContent(context, "Usia", usia),
                                    V(16),
                                    RowContent(
                                        context, "Jenis kelamin", jenisKelamin),
                                    V(16),
                                    RowContent(context, "Lokasi", lokasi),
                                    V(16),
                                    RowContent(context, "Gejala",
                                        selectedSymptoms.join(', ')),
                                    V(16),
                                    RowContent(context, "Penyakit", prediction),
                                    V(16),
                                    RowContent(context, "Pengobatan", "test"),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const TextComponent(
                                    "Kembali",
                                    size: 14,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            );

                            reset();
                          } catch (e) {
                            logO("error", m: e);
                            showSnackbar(
                                "Pesan!", e.toString(), StatusSnackbar.error);
                          }
                        })))
              ],
            ),
          ),
        ));
  }
}

Widget RowContent(BuildContext context, String title, String value) {
  return Row(
    children: [
      TextComponent(
        "$title : ",
        size: 16,
        weight: FontWeight.normal,
      ),
      H(8),
      Container(
        width: 160,
        child: TextComponent(
          value,
          size: 16,
          weight: FontWeight.normal,
        ),
      )
    ],
  );
}
