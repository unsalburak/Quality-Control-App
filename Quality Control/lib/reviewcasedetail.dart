import 'package:flutter/material.dart';
import 'package:flutter_egitim/screens/opencasereview.dart';

class Reviewcasedetails extends StatefulWidget {
  const Reviewcasedetails({super.key, required this.titlereview}); // Constructor, title parametresi alır.
  final String titlereview; // Başlık bilgisini tutan değişken.

  @override
  State<Reviewcasedetails> createState() => _ReviewcasedetailsState(); // State oluşturulur.
}

List<String> reviewCaseno = ["No 127", "No 128", "No 129", "No 130"]; // Case detayları listesi

class _ReviewcasedetailsState extends State<Reviewcasedetails> {
    bool done = true;
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
                Navigator.of(context).push
                (MaterialPageRoute(builder: (context) => opencasereview(
                  titlereview: widget.titlereview,
                ),));
              },
              icon: const Icon(Icons.checklist_outlined), // Buton simgesi.
              label: const Text(''), // Buton metni (boş).
            ),
            Text(widget.titlereview),
             Checkbox(
              value: done, // Checkbox'ın mevcut durumu.
              onChanged: (bool? value) {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
