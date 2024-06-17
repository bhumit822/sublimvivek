// To parse this JSON data, do
//
//     final chatThradeModel = chatThradeModelFromJson(jsonString);

import 'dart:convert';

List<ChatThradeModel> chatThradeModelFromJson(String str) => List<ChatThradeModel>.from(json.decode(str).map((x) => ChatThradeModel.fromJson(x)));

String chatThradeModelToJson(List<ChatThradeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatThradeModel {
    final String? summary;
    final String? websocketUrl;

    ChatThradeModel({
        this.summary,
        this.websocketUrl,
    });

    factory ChatThradeModel.fromJson(Map<String, dynamic> json) => ChatThradeModel(
        summary: json["summary"],
        websocketUrl: json["websocket_url"],
    );

    Map<String, dynamic> toJson() => {
        "summary": summary,
        "websocket_url": websocketUrl,
    };
}
