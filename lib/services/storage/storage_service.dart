import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  // firebase storage
  final firebaseStorage = FirebaseStorage.instance;

  // Images are stored in firebase as download URLs
  List<String> imageUrls = [];

  // Loading Status
  bool _isLoading = false;

  // Uploading Status
  bool _isUploading = false;

  // Getters
  List<String> get imageURLs => imageUrls;
  bool get isLoading => _isLoading;
  bool get isUploading => _isUploading;

  // Read Images
  Future<void> fetchImages() async {
    // start loading
    _isLoading = true;

    // Fetch images from firebase storage
    final ListResult results = await firebaseStorage.ref('products').listAll();

    // get the download url for each image
    final urls =
        await Future.wait(results.items.map((ref) => ref.getDownloadURL()));

    // update imageURLs
    imageUrls = urls;

    // stop loading
    _isLoading = false;
  }

  // Delete Images

  Future<void> deleteImages(String imagePath) async {
    try {
      await firebaseStorage.ref(imagePath).delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Upload Images

  Future<void> uploadImage() async {
    // start uploading
    _isUploading = true;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      _isUploading = false;
      return;
    }

    File file = File(image.path);

    try {
      // File Path
      String filePath = "products/product_id/${DateTime.now()}.png";

      // Upload File to firebase storage
      await firebaseStorage.ref(filePath).putFile(file);

      // Fetch the downalod url
      String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      // stop uploading
      _isUploading = false;
    }
  }
}
