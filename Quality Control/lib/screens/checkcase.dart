import 'package:flutter/material.dart';
import 'package:flutter_egitim/constans/color.dart';
import 'package:flutter_egitim/opencasedetails.dart';
import 'package:hexcolor/hexcolor.dart';

class checkcaseScreen extends StatefulWidget {
  const checkcaseScreen({super.key}); 
  @override
  State<checkcaseScreen> createState() => _checkcaseScreenState();
}
List<String> openCaseno = ["control 1", "Control 2", "Control 3", "Control 4"]; // Case detayları listesi

class _checkcaseScreenState extends State<checkcaseScreen> {
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
                      "Open Case no:", // Başlık metni
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
                    itemCount: openCaseno.length, // reviewCase listesinin uzunluğu
                    itemBuilder: (context, index) {
                      return Opencasedetails(titleopen: openCaseno[index]); // CaseItem widget'ı
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
