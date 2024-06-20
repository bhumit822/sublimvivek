// To parse this JSON data, do
//
//     final vevrifyOtpModel = vevrifyOtpModelFromMap(jsonString);

import 'dart:convert';

VevrifyOtpModel vevrifyOtpModelFromMap(String str) => VevrifyOtpModel.fromMap(json.decode(str));

String vevrifyOtpModelToMap(VevrifyOtpModel data) => json.encode(data.toMap());

class VevrifyOtpModel {
    final String? bearerToken;
    final String? title;
    final String? detail;

    VevrifyOtpModel({
        this.bearerToken,
        this.title,
        this.detail,
    });

    VevrifyOtpModel copyWith({
        String? bearerToken,
        String? title,
        String? detail,
    }) => 
        VevrifyOtpModel(
            bearerToken: bearerToken ?? this.bearerToken,
            title: title ?? this.title,
            detail: detail ?? this.detail,
        );

    factory VevrifyOtpModel.fromMap(Map<String, dynamic> json) => VevrifyOtpModel(
        bearerToken: json["bearer_token"],
        title: json["title"],
        detail: json["detail"],
    );

    Map<String, dynamic> toMap() => {
        "bearer_token": bearerToken,
        "title": title,
        "detail": detail,
    };
}
