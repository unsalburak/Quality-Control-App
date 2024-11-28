import 'package:flutter/material.dart';
import 'package:flutter_egitim/screens/reviewcase.dart';

class Reviewcaseitem extends StatefulWidget {
  const Reviewcaseitem({super.key, required this.title}); // Constructor, title parametresi alır.
  final String title; // Başlık bilgisini tutan değişken.

  @override
  State<Reviewcaseitem> createState() => ReviewcaseitemState(); // State oluşturulur.
}

class ReviewcaseitemState extends State<Reviewcaseitem> {
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
                    builder: (context) => const reviewcaseScreen(), // Butona tıklandığında checkcaseScreen sayfasına yönlendirme.
                  ),
                );
              },
              icon: const Icon(Icons.checklist_outlined), // Buton simgesi.
              label: const Text(''), // Buton metni (boş).
            ),
            Text(widget.title), // Widget'tan gelen başlık metni.

            
            const Checkbox(
        value: true,
        onChanged: null,
        activeColor: Colors.purple,
            ), // Burada eksik parantez tamamlandı.
          ],
        ),
      ),
    );
  }
}