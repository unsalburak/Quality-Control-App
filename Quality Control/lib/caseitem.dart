import 'package:flutter/material.dart';
import 'package:flutter_egitim/screens/checkcase.dart';

class CaseItem extends StatefulWidget {
  const CaseItem({super.key, required this.title}); // Constructor, title parametresi alır.
  final String title; // Başlık bilgisini tutan değişken.

  @override
  State<CaseItem> createState() => CaseItemState(); // State oluşturulur.
}

class CaseItemState extends State<CaseItem> {
  bool isChecked = false; // Checkbox'ın başlangıç durumu.

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15), // Card çevresinde boşluk bırakılır.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Row içindeki öğeleri aralarındaki boşluğu eşit şekilde dağıtır.
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const checkcaseScreen(), // Butona tıklandığında checkcaseScreen sayfasına yönlendirme.
                  ),
                );
              },
              icon: const Icon(Icons.checklist_outlined), // Buton simgesi.
              label: const Text(''), // Buton metni (boş).
            ),
            Text(widget.title), // Widget'tan gelen başlık metni.
            Checkbox(
              value: isChecked, // Checkbox'ın mevcut durumu.
              onChanged: (bool? val) {
                if (val != null) {
                  setState(() {
                    isChecked = val; // Checkbox'ın durumu değiştiğinde güncellenir.
                  });
                }
              },
            ), // Burada eksik parantez tamamlandı.
          ],
        ),
      ),
    );
  }
}
