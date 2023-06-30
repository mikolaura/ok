
class UserModel {
  final String uid;
  final String email;
  final String username;
  final String profileImageURL;
  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.profileImageURL,
  });
  

  UserModel copyWith({
    String? uid,
    String? email,
    String? username,
    String? profileImageURL,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      profileImageURL: profileImageURL ?? this.profileImageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'profileImageURL': profileImageURL,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
     T isA<T>(k) => map[k] is T ? map[k] : throw ArgumentError.value(map[k], k);
    return UserModel(
      uid: isA<String>('uid'),
      email: isA<String>('email'),
      username: isA<String>('username'),
      profileImageURL: isA<String>('profileImageURL'),
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, username: $username, profileImageURL: $profileImageURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.email == email &&
      other.username == username &&
      other.profileImageURL == profileImageURL;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      email.hashCode ^
      username.hashCode ^
      profileImageURL.hashCode;
  }
}
