class OpponentPost {
  final String id;
  final String userId;
  final String userName;
  final String city;
  final String fieldName;
  final DateTime matchTime;
  final int playerCount;
  final double price;
  final String contactInfo;
  final String description;

  OpponentPost({
    required this.id,
    required this.userId,
    required this.userName,
    required this.city,
    required this.fieldName,
    required this.matchTime,
    required this.playerCount,
    required this.price,
    required this.contactInfo,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'city': city,
      'fieldName': fieldName,
      'matchTime': matchTime.toIso8601String(),
      'playerCount': playerCount,
      'price': price,
      'contactInfo': contactInfo,
      'description': description,
    };
  }

  factory OpponentPost.fromMap(Map<String, dynamic> map) {
    return OpponentPost(
      id: map['id'],
      userId: map['userId'],
      userName: map['userName'],
      city: map['city'],
      fieldName: map['fieldName'],
      matchTime: DateTime.parse(map['matchTime']),
      playerCount: map['playerCount'],
      price: map['price'],
      contactInfo: map['contactInfo'],
      description: map['description'],
    );
  }
} 