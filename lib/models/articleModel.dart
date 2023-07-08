import 'dart:convert';

class ArticleModel {
  String uid;
  String username;
  String profilePicture;
  String title;
  String text;
  String anons;
  String imageURL;
  ArticleModel({
    required this.uid,
    required this.username,
    required this.profilePicture,
    required this.title,
    required this.text,
    required this.anons,
    required this.imageURL,
  });

  ArticleModel copyWith({
    String? uid,
    String? username,
    String? profilePicture,
    String? title,
    String? text,
    String? anons,
    String? imageURL,
  }) {
    return ArticleModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
      title: title ?? this.title,
      text: text ?? this.text,
      anons: anons ?? this.anons,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uid': uid});
    result.addAll({'username': username});
    result.addAll({'profilePicture': profilePicture});
    result.addAll({'title': title});
    result.addAll({'text': text});
    result.addAll({'anons': anons});
    result.addAll({'imageURL': imageURL});
  
    return result;
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      anons: map['anons'] ?? '',
      imageURL: map['imageURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArticleModel(uid: $uid, username: $username, profilePicture: $profilePicture, title: $title, text: $text, anons: $anons, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ArticleModel &&
      other.uid == uid &&
      other.username == username &&
      other.profilePicture == profilePicture &&
      other.title == title &&
      other.text == text &&
      other.anons == anons &&
      other.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      username.hashCode ^
      profilePicture.hashCode ^
      title.hashCode ^
      text.hashCode ^
      anons.hashCode ^
      imageURL.hashCode;
  }
}
