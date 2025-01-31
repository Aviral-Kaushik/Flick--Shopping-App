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

  Future<bool> deleteImages(String imageURL) async {
    try {
      await firebaseStorage.refFromURL(imageURL).delete();
      // await firebaseStorage.ref(imagePath).delete();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  // Upload Images

  Future<void> uploadImage(String sellerName, String productName,
      List<XFile>? productImages, Function(List<String>) onSuccess,
      Function() onFailure) async {
    // start uploading
    _isUploading = true;

    List<String> downloadURLs = [];
    productName = productName.replaceAll(" ", "_");

    if (productImages == null) {
      _isUploading = false;
      return;
    }

    for (XFile xFile in productImages) {
      File file = File(xFile.path);

      try {
        // File Path
        String filePath = "products/$sellerName-$productName${DateTime
            .now()}.png";

        // Upload File to firebase storage
        await firebaseStorage.ref(filePath).putFile(file);

        // Fetch the download url
        String downloadURL = await firebaseStorage.ref(filePath).getDownloadURL();
        downloadURLs.add(downloadURL);
      } catch (e) {
        debugPrint(e.toString());
        onFailure();
        break;
      }
    }

    // stop uploading
    _isUploading = false;

    if (downloadURLs.isNotEmpty) {
      onSuccess(downloadURLs);
    } else {
      onFailure();
    }

  }
}
