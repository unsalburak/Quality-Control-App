import 'package:flutter/material.dart';
import 'package:flutter_egitim/screens/home.dart';
import 'package:flutter_egitim/services/user_service.dart';

// LoginScreen sınıfı, StatefulWidget (durum bilgisi olan widget) yapısından türetilir.
// Bu ekran, kullanıcı giriş işlemi için kullanılır.
// onLogin parametresi, başarılı giriş sonrası çalıştırılacak bir callback fonksiyonudur.
class LoginScreen extends StatefulWidget {
  final VoidCallback onLogin; // Giriş yapıldığında çalışacak fonksiyon

  // LoginScreen yapıcı fonksiyonu, onLogin fonksiyonunu zorunlu olarak alır.
  // Key ise opsiyonel olarak atanabilir.
  const LoginScreen({required this.onLogin, super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// _LoginScreenState sınıfı, LoginScreen için durum bilgisini yöneten sınıftır.
class _LoginScreenState extends State<LoginScreen> {
  // Kullanıcı adı ve şifre için TextEditingController nesneleri oluşturuluyor.
  // Bu nesneler, metin alanlarına girilen verileri kontrol etmek ve almak için kullanılır.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // UserService sınıfı başlatılıyor. Bu sınıf, kullanıcı doğrulama işlemlerini gerçekleştirmek için kullanılacak.
  final UserService _userService = UserService();

  // Kullanıcı giriş işleminin gerçekleştirileceği fonksiyon.
  // Bu fonksiyon, kullanıcı adı ve şifreyi alır, UserService aracılığıyla doğrulama yapar.
  void _login() async {
    String username = _usernameController.text; // Kullanıcı adını alır
    String password = _passwordController.text; // Şifreyi alır

    // UserService üzerinden kullanıcı doğrulaması yapılır.
    // Doğrulama asenkron olduğu için await ile beklenir.
    bool isValidUser = await _userService.validateUser(username, password);

    // Eğer kullanıcı geçerliyse
    if (isValidUser) {
      widget.onLogin(); // onLogin callback fonksiyonu çalıştırılır (giriş başarılı).
      
      // Ana sayfaya yönlendirme yapılır. 
      // Navigator.pushReplacement, geri dönülemez bir yönlendirme sağlar.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(onLogout: _handleLogout), 
          // HomeScreen'de oturumu kapatma işlemi için onLogout fonksiyonu iletilir
        ),
      );
    } else {
      // Giriş başarısızsa hata mesajı gösterilir.
      _showLoginError();
    }
  }
  // Oturum kapatma işlemi için kullanılacak fonksiyon.
  // Oturum kapatıldığında kullanıcı tekrar giriş ekranına döner.
  void _handleLogout() {
    // Navigator.pop, geçerli sayfayı geri alır, login ekranını tekrar açar.
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(onLogin: () {
          // Giriş işlevi burada sağlanabilir (opsiyonel olarak özelleştirilebilir)
        }),
      ),
    );
  }
  // Giriş başarısız olduğunda hata mesajı göstermek için kullanılan fonksiyon.
  void _showLoginError() {
    // AlertDialog ile bir hata mesajı gösterilir.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'), // Diyalog başlığı
        content: const Text('Invalid username or password.'), // Diyalog içeriği (hata mesajı)
        actions: [
          TextButton(
            onPressed: () {
              // Kullanıcı "OK" tuşuna bastığında diyalog kapanır.
              Navigator.of(context).pop();
            },
            child: const Text('OK'), // "OK" tuşu metni
          ),
        ],
      ),
    );
  }
  // Widget ağacını oluşturan build fonksiyonu.
  // Scaffold, ekranın temel yapı taşıdır.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // Üstte basit bir AppBar başlığı
      body: Padding(
        padding: const EdgeInsets.all(16.0), // İçerik etrafına boşluk ekler
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // İçerikleri dikeyde ortalar
          children: [
            // Kullanıcı adı için TextField (metin alanı).
            // Controller aracılığıyla kullanıcı adı buraya girilir.
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'), // Kullanıcı adı etiketi
            ),
            // Şifre alanı için TextField (metin alanı).
            // obscureText true olduğu için şifre gizlenerek gösterilir.
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'), // Şifre etiketi
              obscureText: true, // Şifreyi gizler
            ),
            const SizedBox(height: 20), // TextField'lar arasında boşluk bırakır
            // Giriş yapma butonu
            ElevatedButton(
              onPressed: _login, // Butona tıklandığında _login fonksiyonu çalışır.
              child: const Text('Login'), // Buton metni
            ),
          ],
        ),
      ),
    );
  }
}
