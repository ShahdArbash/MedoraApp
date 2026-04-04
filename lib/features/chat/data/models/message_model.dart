class MessageModel {
  final String role;
  final List<MessagePart> parts;

  String get text => parts.isNotEmpty ? parts.first.text : "";

  MessageModel({required this.role, required this.parts});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final partsJson = json["parts"] as List? ?? [];

    return MessageModel(
      role: json["role"] ?? "model",
      parts: partsJson.map((part) => MessagePart.fromJson(part)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {"role": role, "parts": parts.map((part) => part.toJson()).toList()};
  }
}

class MessagePart {
  final String text;

  MessagePart({required this.text});

  factory MessagePart.fromJson(Map<String, dynamic> json) {
    return MessagePart(text: json["text"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"text": text};
  }
}
