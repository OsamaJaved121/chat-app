// ignore_for_file: no_leading_underscores_for_local_identifiers

class ChatUser {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  late DateTime lastActive;

  ChatUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.lastActive,
  });

  factory ChatUser.fromJson(Map<String, dynamic> _json) {
    return ChatUser(
      uid: _json["uid"],
      name: _json["name"],
      email: _json["email"],
      imageUrl: _json["image"],
      lastActive: _json["lastActive"].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "lastActive": lastActive,
      "imageUrl": imageUrl,
    };
  }

  String lastDayActive() {
    return "${lastActive.month}/${lastActive.day}/${lastActive.year}";
  }

  bool wasRecentlyActive() {
    return DateTime.now().difference(lastActive).inHours < 2;
  }
}
