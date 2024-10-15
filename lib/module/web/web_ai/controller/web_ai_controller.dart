import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/web_ai_view.dart';
import 'dart:html' as html;

class WebAIController extends State<WebAIView> {
  static late WebAIController instance;
  late WebAIView view;
  Map? result;
  @override
  void initState() {
    instance = this;
    super.initState();
  }

  // XFile? photoA;
  // XFile? photoB;
  Uint8List? photoABytes;
  Uint8List? photoBBytes;

  final ImagePicker _picker = ImagePicker();
  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  Widget buildPhotoColumn(
      String label, Uint8List? photoBytes, VoidCallback onPick) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 200,
          color: Colors.grey[300],
          child: photoBytes != null
              ? Image.memory(photoBytes) // Menampilkan gambar dari bytes
              : const Center(
                  child: Text(
                      "No Image")), // Menampilkan teks jika tidak ada gambar
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onPick,
          child: const Text(
            "Upload",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void pickPhoto(String type) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Membaca file sebagai bytes
      final Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        if (type == 'A') {
          photoABytes = bytes; // Menyimpan data foto A
        } else {
          photoBBytes = bytes; // Menyimpan data foto B
        }
      });
    }
  }

  void comparePhotos() async {
    await checkImage();
  }

  String imageToBase64(Uint8List bytes) {
    String base64Image = base64Encode(bytes);
    return base64Image;
  }

  checkImage() async {
    showLoading();
    try {
      var response = await Dio().post(
        "https://87fe-103-180-122-247.ngrok-free.app/recognize",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "registered_photo": imageToBase64(photoABytes!),
          "photo_check_in": imageToBase64(photoBBytes!),
        },
      );

      setState(() {
        result = response.data;
      });
      hideLoading();
    } on DioException catch (err) {
      hideLoading();
      print(err);
    }
  }
}
