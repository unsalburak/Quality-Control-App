import 'package:flutter/material.dart';
import 'package:flutter_egitim/constans/color.dart';
import 'package:flutter_egitim/reviewcasedetail.dart';
import 'package:hexcolor/hexcolor.dart';

class reviewcaseScreen extends StatefulWidget {
  const reviewcaseScreen({super.key}); 
  @override
  State<reviewcaseScreen> createState() => _reviewcaseScreenState();
}
List<String> reviewCaseno = ["Review 1", "Review 2", "Review 3", "Review 4"]; // Case detayları listesi
class _reviewcaseScreenState extends State<reviewcaseScreen> {
 // StatelessWidget olarak tanımlanıyor.
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height; // Cihazın yüksekliği hesaplanıyor.
    double deviceWidth = MediaQuery.of(context).size.width; // Cihazın genişliği hesaplanıyor.

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backGroundColor), // Arka plan rengi ayarlanıyor.
        appBar: AppBar(), // AppBar ekleniyor.
        body: Column(
          children: [
            // Üst kısım (header) oluşturuluyor.
            Container(
              height: deviceHeight / 5, // Header yüksekliği
              width: deviceWidth, // Header genişliği
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 33, 47, 243), // Sabit arka plan rengi
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/header.png"), // Header resmi
                  fit: BoxFit.cover, // Resmin yerleşim biçimi
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20), // Üstten boşluk
                    child: Text(
                      "08/21/24", // Tarih metni
                      style: TextStyle(color: Colors.white, fontSize: 15), // Yazı stili
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30), // Üstten boşluk
                    child: Text(
                      "Review Case no:", // Başlık metni
                      style: TextStyle(
                        color: Colors.white, // Yazı rengi
                        fontSize: 30, // Yazı boyutu
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // reviewCase listesindeki öğeler görüntüleniyor.
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10), // İçerik çevresinde boşluk
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: reviewCaseno.length, // reviewCase listesinin uzunluğu
                    itemBuilder: (context, index) {
                      return Reviewcasedetails(titlereview: reviewCaseno[index]); // CaseItem widget'ı
                    },
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