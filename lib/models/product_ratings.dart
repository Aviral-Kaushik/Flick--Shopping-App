import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick/models/rating.dart';

class ProductRatings {

  ProductRatings({
   required this.productId,
   required this.avgRating,
   required this.totalNumberOfRating,
   required this.ratings,
  });

  ProductRatings.empty();

  String? productId;
  int? avgRating;
  int? totalNumberOfRating;
  List<Rating>? ratings;

  Map<String, dynamic> toFirestore() {
    return {
      'productId': productId,
      'avgRating': avgRating,
      'totalNumberOfRating': totalNumberOfRating,
      'ratings': ratings != null
          ? ratings!.map((rating) => rating.toFirestore()).toList()
          : List.empty(),
    };
  }

  factory ProductRatings.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ProductRatings(
      productId: snapshot['productId'] ?? '',
      avgRating: snapshot['avgRating'] ?? 0,
      totalNumberOfRating: snapshot['totalNumberOfRating'] ?? 0,
      ratings: (snapshot['ratings'] as List<dynamic>)
          .map((item) => Rating.fromFirestore(item))
          .toList(),
    );
  }

  factory ProductRatings.fromMap(Map<String, dynamic> data) {
    return ProductRatings(
      productId: data['productId'] ?? '',
      avgRating: data['avgRating'] ?? 0,
      totalNumberOfRating: data['totalNumberOfRating'] ?? 0,
      ratings: (data['ratings'] as List<dynamic>)
          .map((item) => Rating.fromFirestore(item))
          .toList(),
    );
  }
}