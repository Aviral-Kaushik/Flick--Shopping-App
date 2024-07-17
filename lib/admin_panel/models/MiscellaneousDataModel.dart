import 'package:cloud_firestore/cloud_firestore.dart';

class MiscellaneousDataModel {
  final int totalUsers;
  final int totalProducts;
  final int totalSales;
  final int totalSellers;

  MiscellaneousDataModel(
      this.totalUsers,
      this.totalProducts,
      this.totalSales,
      this.totalSellers);

  Map<String, dynamic> toFirestore() {
    return {
      "total_users": totalUsers,
      "total_products": totalProducts,
      "total_sales": totalSales,
      "total_sellers": totalSellers,
    };
  }

  factory MiscellaneousDataModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    return MiscellaneousDataModel(
        data?["total_users"],
        data?["total_products"],
        data?["total_sales"],
        data?["total_sellers"]);
  }

  static String mapFieldNameToFirebase(String miscellaneousType) {

    if (miscellaneousType == "users") {
      return "total_users";
    } else if (miscellaneousType == "products") {
      return "total_products";
    } else if (miscellaneousType == "sales") {
      return "total_sales";
    } else {
      return "total_sellers";
    }
  }
}
