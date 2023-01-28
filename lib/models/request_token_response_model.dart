import 'dart:convert';

class RequestTokenResponseModel {
  RequestTokenResponseModel({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  bool? success;
  String? expiresAt;
  String? requestToken;

  factory RequestTokenResponseModel.fromRawJson(String str) =>
      RequestTokenResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      RequestTokenResponseModel(
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
