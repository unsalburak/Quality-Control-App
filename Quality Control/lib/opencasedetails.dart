import 'package:flutter/material.dart';
import 'package:flutter_egitim/screens/casestudy.dart';

class Opencasedetails extends StatefulWidget {
  const Opencasedetails({super.key, required this.titleopen}); // Constructor, title parametresi alır.
  final String titleopen; // Başlık bilgisini tutan değişken.

  @override
  State<Opencasedetails> createState() => _OpencasedetailsState(); // State oluşturulur.
}

List<String>openCaseno = ["No 123", "No 124", "No 125", "No 126"]; // Case detayları listesi

class _OpencasedetailsState extends State<Opencasedetails> {
  bool done = false;
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
                (MaterialPageRoute(builder: (context) => casestudy(
                  titlereview: widget.titleopen,),));
              },
              icon: const Icon(Icons.checklist_outlined), // Buton simgesi.
              label: const Text(''), // Buton metni (boş).
            ),
            Text(widget.titleopen),
              Checkbox(
              value: done, // Checkbox'ın mevcut durumu.
              onChanged: (bool? val) {
                if (val != null) {
                  setState(() {
                    done = val; // Checkbox'ın durumu değiştiğinde güncellenir.
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
