import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tripsharemobile_s4/models/blobUploadResponseDTO.dart';
import 'package:tripsharemobile_s4/services/blobService.dart';

class BlobViewModel extends ChangeNotifier{
  final BlobService blobService;

  BlobViewModel(this.blobService);

  Future<String> uploadImage(MultipartFile image) async{
    final response = await blobService.uploadImage(image);
    return response.uri;
  }

}