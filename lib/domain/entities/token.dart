import 'dart:convert';

class Token {
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  Token({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Token.empty() =>
      Token(id: '', name: '', createdAt: '', updatedAt: '');

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      id: map['id'] as String,
      name: map['name'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);
}
