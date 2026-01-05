import 'package:json_annotation/json_annotation.dart';

part 'blobUploadResponseDTO.g.dart';

@JsonSerializable()
class BlobUploadResponseDTO {
  String fileName;
  String uri;

  BlobUploadResponseDTO({required this.fileName, required this.uri});

  factory BlobUploadResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$BlobUploadResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BlobUploadResponseDTOToJson(this);
}
