import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<bool> validateUser(String username, String password) async {
  try {
    QuerySnapshot querySnapshot = await users
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();

    // Sonuçları konsolda yazdırarak doğruluğunu kontrol edelim
    print("Query Result: ${querySnapshot.docs.length}");

    return querySnapshot.docs.isNotEmpty; // Kullanıcı varsa true döndürür
  } catch (e) {
    print('Bir hata oluştu: $e');
    return false; // Hata durumunda false döndürür
  }
}

}
