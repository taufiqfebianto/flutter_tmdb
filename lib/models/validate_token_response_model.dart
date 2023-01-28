import 'dart:convert';

class ValidateTokenResponseModel {
  ValidateTokenResponseModel({
    this.success,
    this.sessionId,
  });

  bool? success;
  String? sessionId;

  factory ValidateTokenResponseModel.fromRawJson(String str) =>
      ValidateTokenResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValidateTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      ValidateTokenResponseModel(
        success: json["success"],
        sessionId: json["session_id"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "session_id": sessionId,
      };
}
