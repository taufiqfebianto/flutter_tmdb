import 'dart:convert';

class RequsetTokenResponseModel {
  RequsetTokenResponseModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  bool success;
  String expiresAt;
  String requestToken;

  factory RequsetTokenResponseModel.fromRawJson(String str) =>
      RequsetTokenResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequsetTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      RequsetTokenResponseModel(
        success: json["success"],
        expiresAt: json["expires_at"],
        requestToken: json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "expires_at": expiresAt,
        "request_token": requestToken,
      };
}
