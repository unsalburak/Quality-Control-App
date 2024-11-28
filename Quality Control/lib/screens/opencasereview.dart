import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_egitim/constans/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class opencasereview extends StatefulWidget {
  const opencasereview({super.key, required this.titlereview});
  final String titlereview;

  @override
  State<opencasereview> createState() => _opencasereviewState();
}

class _opencasereviewState extends State<opencasereview> {
  final List<GroupItem> _items = [const GroupItem()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backGroundColor),
        appBar: AppBar(
          title: Text(widget.titlereview),
        ),
        body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                _items[index],
                const SizedBox(height: 20),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _items.add(const GroupItem());
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class GroupItem extends StatefulWidget {
  const GroupItem({super.key});

  @override
  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  File? _image;
  TextEditingController measuredController = TextEditingController();
  TextEditingController requiredController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _uploadData() async {
    if (_image != null) {
      // Fotoğrafı Firebase Storage'a yükleme
      final storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = storageRef.putFile(_image!);
      final snapshot = await uploadTask.whenComplete(() => null);
      final imageUrl = await snapshot.ref.getDownloadURL();

      // Firestore'a verileri kaydetme
      await _firestore.collection('case_detail').add({
        'measured': measuredController.text,
        'required': requiredController.text,
        'image_url': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image != null
            ? Image.file(
                _image!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              )
            : const Text('You did not pick a photo yet.'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _pickImage,
          child: const Text('Pick Photo'),
        ),
        const SizedBox(height: 20),
        const Text("review"),

        // "Measured Dimension" ve "Required Dimension" kutuları
        _buildDimensionBox(
          label: 'Measured Dimension',
          controller: measuredController,
        ),
        const SizedBox(height: 20),
        _buildDimensionBox(
          label: 'Required Dimension',
          controller: requiredController,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _uploadData,
          child: const Text('Save to Firestore'),
        ),
      ],
    );
  }

  Widget _buildDimensionBox({required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter $label',
          ),
        ),
      ],
    );
  }
}
