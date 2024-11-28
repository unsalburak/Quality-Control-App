import 'package:cloud_firestore/cloud_firestore.dart';

class CaseServices {
  final CollectionReference cases = FirebaseFirestore.instance.collection('cases');

  // Firestore'a yeni bir case ekler
  Future<void> addCase({
    required String caseName,
    required String description,
    required String status,
    required String assignedUser,
    required DateTime createdAt,
  }) async {
    try {
      await cases.add({
        'caseName': caseName,
        'description': description,
        'status': status,
        'assignedUser': assignedUser,
        'createdAt': createdAt,
      });
      print('Case başarıyla eklendi');
    } catch (e) {
      print('Case ekleme hatası: $e');
    }
  }

  // Firestore'dan tüm case'leri getirir
  Future<List<QueryDocumentSnapshot>> getAllCases() async {
    try {
      QuerySnapshot querySnapshot = await cases.get();
      return querySnapshot.docs;
    } catch (e) {
      print('Caseleri getirme hatası: $e');
      return [];
    }
  }

  // Verilen ID'ye göre tek bir case getirir
  Future<DocumentSnapshot?> getCaseById(String caseId) async {
    try {
      DocumentSnapshot documentSnapshot = await cases.doc(caseId).get();
      if (documentSnapshot.exists) {
        return documentSnapshot;
      } else {
        print('Verilen ID ile eşleşen bir case bulunamadı');
        return null;
      }
    } catch (e) {
      print('Case getirme hatası: $e');
      return null;
    }
  }

  // Verilen ID'ye göre case durumunu günceller
  Future<void> updateCaseStatus(String caseId, String newStatus) async {
    try {
      await cases.doc(caseId).update({'status': newStatus});
      print('Case durumu başarıyla güncellendi');
    } catch (e) {
      print('Case durumu güncelleme hatası: $e');
    }
  }

  // Verilen ID'ye göre bir case siler
  Future<void> deleteCase(String caseId) async {
    try {
      await cases.doc(caseId).delete();
      print('Case başarıyla silindi');
    } catch (e) {
      print('Case silme hatası: $e');
    }
  }
}
