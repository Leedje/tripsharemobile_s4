import 'package:http/http.dart';
import 'package:tripsharemobile_s4/api/apiClient.dart';
import 'package:tripsharemobile_s4/models/blobUploadResponseDTO.dart';

class BlobService {
  final ApiClient _client = ApiClient();

  Future<BlobUploadResponseDTO> uploadImage(MultipartFile image) async {
    final response = await _client.postMultipart('/blob', image);
    return BlobUploadResponseDTO.fromJson(response);

  }
}