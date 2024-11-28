import 'package:flutter/material.dart';
import 'package:flutter_egitim/CaseItem.dart';
import 'package:flutter_egitim/constans/color.dart';
import 'package:flutter_egitim/opencasedetails.dart';
import 'package:flutter_egitim/reviewcasedetail.dart';
import 'package:flutter_egitim/reviewcaseitem.dart';
import 'package:hexcolor/hexcolor.dart';


class HomeScreen extends StatefulWidget {
  final VoidCallback onLogout;

  const HomeScreen({required this.onLogout, super.key});
  

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height; // Cihaz yüksekliği
    double deviceWidth = MediaQuery.of(context).size.width; // Cihaz genişliği

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backGroundColor), // Arka plan rengi
        body: Column(
          children: [
            Container(
              height: deviceHeight / 5, // Header yüksekliği
              width: deviceWidth, // Header genişliği
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 33, 47, 243), // Header arka plan rengi
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/header.png"), // Header resmi
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20), // Üstten boşluk
                    child: Text(
                      "08/20/24", // Tarih metni
                      style: TextStyle(color: Colors.white, fontSize: 15), // Yazı stili
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30), // Üstten boşluk
                    child: Text(
                      "Quality Control", // Başlık metni
                      style: TextStyle(
                        color: Colors.white, // Yazı rengi
                        fontSize: 30, // Yazı boyutu
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10), // İçerik çevresinde boşluk
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: openCaseno.length, // openCase listesinin uzunluğu
                    itemBuilder: (context, index) {
                      return CaseItem(title: openCaseno[index]); // CaseItem widget'ı
                    },
                  ),
                ),
              ),
            ),
            const Text("Review"), // "Review" başlığı
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10), // İçerik çevresinde boşluk
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: reviewCaseno.length, // reviewCase listesinin uzunluğu
                    itemBuilder: (context, index) {
                      return Reviewcaseitem(title: reviewCaseno[index]); // Reviewcaseitem widget'ı
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: widget.onLogout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
