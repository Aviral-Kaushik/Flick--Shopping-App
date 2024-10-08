import 'package:cloud_firestore/cloud_firestore.dart';

class Rating {

  Rating({
    required this.rating,
    required this.ratingComment,
    required this.username,
    required this.ratingDate
  });

  int rating;
  String ratingComment;
  String username;
  String ratingDate;

  factory Rating.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Rating(
        rating: data?["rating"],
        ratingComment: data?["rating_comment"],
        username: data?["username"],
        ratingDate: data?["rating_date"]
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "rating": rating,
      "rating_comment": ratingComment,
      "username": username,
      "rating_date": ratingDate
    };
  }
}