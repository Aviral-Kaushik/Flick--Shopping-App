import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick/admin_panel/helper/RulesAndRegulationHelper.dart';
import 'package:flick/admin_panel/models/MiscellaneousDataModel.dart';
import 'package:flick/admin_panel/models/referrals/referral_data.dart';
import 'package:flick/admin_panel/utils/firebase/collections.dart';
import 'package:flick/models/Address.dart';
import 'package:flick/models/Message.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/product_ratings.dart';
import 'package:flick/models/rating.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';

class FirebaseServices {

  var database;

  FirebaseServices() {
    database = FirebaseFirestore.instance;
  }

  Future<List<User>> fetchAllUsers() async {
    List<User> users = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
    await database.collection(usersCollection).get();

    users = snapshot.docs.map((snapshot) {
      return User.fromFirestore(snapshot);
    }).toList();

    return users;
  }

  Future<bool> createNewUser(User user) async {
    bool userCreatedSuccessfully = false;

    DocumentReference newUserReference =
        database.collection(usersCollection).doc();
    user.id = newUserReference.id;

    await newUserReference.set(user.toFirestore()).then((value) {
      userCreatedSuccessfully = true;
    }).catchError((error) {
      userCreatedSuccessfully = false;
    });

    return userCreatedSuccessfully;
  }

  Future<Tuple2<bool, String>> updateUser(User user) async  {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(usersCollection)
        .doc(user.id)
        .update(user.toFirestore())
        .then((value) => debugPrint("User Updated Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> deleteUser(User user) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(usersCollection)
        .doc(user.id)
        .delete()
        .then((value) => debugPrint("User Deleted Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<User?> getUserDataFromMail(String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await database
          .collection(usersCollection)
          .where("email", isEqualTo: email)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return User.fromFirestore(snapshot.docs.first);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }

  }

  Future<Tuple2<bool, String>> changeAdminAccessForUserInUsersCollection(
      User user, bool provideAdminAccess) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(usersCollection)
        .doc(user.id)
        .update({"is_admin": provideAdminAccess})
        .then(
            (value) =>
            debugPrint("Admin Access changed for user in users collection"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<List<Product>> fetchAllProducts() async {
    List<Product> products = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await database.collection(productsCollection).get();

    products = snapshot.docs.map((product) {
      return Product.fromFirestore(product);
    }).toList();

    return products;
  }

  Future<bool> createNewProduct(Product product) async {
    bool productCreateSuccessfully = false;

    DocumentReference newProductReference =
        database.collection(productsCollection).doc();
    product.id = newProductReference.id;

    newProductReference.set(product.toFirestore()).then((value) {
      productCreateSuccessfully = true;
    }).catchError((error) {
      productCreateSuccessfully = false;
    });

    return productCreateSuccessfully;
  }

  Future<Tuple2<bool, String>> updateProduct(Product product) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(productsCollection)
        .doc(product.id)
        .update(product.toFirestore())
        .then((e) => debugPrint("Product Updated Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> deleteProduct(Product product) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(productsCollection)
        .doc(product.id)
        .delete()
        .then((e) => debugPrint("Product Updated Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> updateProductStock(
      String productId, int stock) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(productsCollection)
        .doc(productId)
        .update({"stock": stock}).then(
            (e) => debugPrint("Product Updated Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> updateProductPrice(
      String productId, int newPrice) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(productsCollection)
        .doc(productId)
        .update({"product_price": newPrice}).then(
            (e) => debugPrint("Product Updated Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<List<Message>> getAllMessagesFromFirebase() async {
    List<Message> messages = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await database.collection(messagesCollection).get();

    messages = snapshot.docs.map((message) {
      return Message.fromFirestore(message);
    }).toList();

    return messages;
  }

  Future<Tuple2<bool, String>> deleteMessageInFirebase(Message message) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    database.collection(messagesCollection).doc(message.id).delete().then(
        (doc) => debugPrint("Document deleted successfully"),
      onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
      }
    );

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  void createNewMessage(Message message) async {

      DocumentReference documentReference =
      database.collection(messagesCollection).doc();
      message.id = documentReference.id;

      await documentReference.set(message.toFirestore());

  }

  Future<List<User>> fetchAllAdmins() async {
    List<User> admins = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await database.collection(adminsCollection).get();

    admins = snapshot.docs.map((admin) {
      return User.fromFirestore(admin);
    }).toList();

    return admins;
  }

  Future<Tuple2<bool, String>> deleteAdmin(User user) async {
    // TODO this is also okay but we need to make is admin to false in users
    //  collection to take off admin privileges
    bool hasErrorOccurred = false;
    String errorMessage = "";

    database
        .collection(adminsCollection)
        .doc(user.id)
        .delete()
        .then((doc) => debugPrint("Admin Deleted Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  void createNewAdmin(String email) {
    /**TODO
     * Firstly we need to fetch the user from user collection with this mail,
     * then we have to create admin
     * */
  }

  Future<String> fetchTermsOrPrivacy(
      bool shouldFetchPrivacyPolicy) async {

    String docName =
    shouldFetchPrivacyPolicy ? "Privacy Policy" : "Terms & Conditions";

    DocumentSnapshot<Map<String, dynamic>> snapshot = await database
        .collection(rulesAndRegulationCollection)
        .doc(docName)
        .get();

    return RulesAndRegulationHelper().fetchTermsAndPrivacyFromMap(
        snapshot.data(), shouldFetchPrivacyPolicy);
  }

  Future<Tuple2<bool, String>> updateTermsOrPrivacy(
      String termsAndPrivacy, bool updatePrivacyPolicy) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    String documentName =
    updatePrivacyPolicy ? "Privacy Policy" : "Terms & Conditions";

    DocumentReference rulesAndRegulationDocumentReference =
    database.collection(rulesAndRegulationCollection).doc(documentName);

    rulesAndRegulationDocumentReference
        .update(RulesAndRegulationHelper().generateMapForStoringInFirebase(
        termsAndPrivacy, updatePrivacyPolicy))
        .then((value) => debugPrint("Rules & Regulation Updated Successfully"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<ReferralData> fetchReferralData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await database
        .collection(referralsCollection).doc("Referrals Data").get();

    return ReferralData.fromFirestore(snapshot);
  }

  Future<Tuple2<bool, String>> incrementReferralsCount(
      String referralType) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(referralsCollection)
        .doc("Referrals Data")
        .update({
      ReferralData.mapFieldNameToFirebase(referralType): FieldValue.increment(1)
    }).then((value) => debugPrint("Referral Count Incremented Successfully"),
            onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> updateReferralMessage(
      String referralMessage) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(referralsCollection)
        .doc("Referrals Data")
        .update({"referral_message": referralMessage})
        .then((value) => debugPrint("Referral Message Updated Successfully"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> storeAllMessagesInFirebase(
      List<Message> messages) async {

    for (Message message in messages) {
      DocumentReference documentReference =
          database.collection(messagesCollection).doc();
      message.id = documentReference.id;

      await documentReference.set(message.toFirestore());
    }
    return const Tuple2(false, "");
  }

  void storeTermsOrPrivacy(
      String termsOrPrivacy, bool storePrivacyPolicy) async {

    DocumentReference rulesAndRegulationDocumentReference = database
        .collection(rulesAndRegulationCollection)
        .doc(storePrivacyPolicy ? "Privacy Policy" : "Terms & Conditions");

    await rulesAndRegulationDocumentReference.set(RulesAndRegulationHelper()
        .generateMapForStoringInFirebase(termsOrPrivacy, storePrivacyPolicy));
  }

  Future<MiscellaneousDataModel> fetchMiscellaneousData() async {

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await database
        .collection(miscellaneousCollection)
        .doc("Miscellaneous")
        .get();

    return MiscellaneousDataModel.fromFirestore(documentSnapshot);
  }

  Future<Tuple2<bool, String>> incrementMiscellaneousField(
      String miscellaneousType) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(miscellaneousCollection)
        .doc("Miscellaneous")
        .update({
      MiscellaneousDataModel.mapFieldNameToFirebase(miscellaneousType):
          FieldValue.increment(1)
    }).then((value) => debugPrint("Miscellaneous Data Updated Successfully"),
            onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<List<User>> fetchTopSellers() async {
    List<User> users = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
    await database.collection(topSellersCollection).get();

    users = snapshot.docs.map((snapshot) {
      return User.fromFirestore(snapshot);
    }).toList();

    return users;
  }

  void storeReferralData(ReferralData referralData) async {

    DocumentReference referralsReference =
        database.collection(referralsCollection).doc("Referrals Data");

    await referralsReference.set(referralData.toFirestore());
  }

  void storeAdminsData(List<User> admins) async {

    for (User admin in admins) {
      DocumentReference adminReference =
          database.collection(adminsCollection).doc();
      admin.id = adminReference.id;
      await adminReference.set(admin.toFirestore());
    }

  }

  void storeAllUsersData(List<User> users) async {

    for (User user in users) {
      DocumentReference userReference =
          database.collection(usersCollection).doc();

      user.id = userReference.id;
      await userReference.set(user.toFirestore());
    }

  }

  void storeAllProducts(List<Product> products) async {

    for (Product product in products) {
      DocumentReference productReference =
          database.collection(productsCollection).doc();

      product.id = productReference.id;
      await productReference.set(product.toFirestore());
    }

  }

  void storeAllTopSellers(List<User> topSellers) async {

    for (User topSeller in topSellers) {

      DocumentReference topSellerReference =
          database.collection(topSellersCollection).doc();
      topSeller.id = topSellerReference.id;

      await topSellerReference.set(topSeller.toFirestore());
    }

  }

  void storeMiscellaneousData(
      MiscellaneousDataModel miscellaneousDataModel) async {

    await database
        .collection(miscellaneousCollection)
        .doc("Miscellaneous")
        .set(miscellaneousDataModel.toFirestore());

  }

  void storeAllAddresses(List<Address> addresses) async  {

    for (Address address in addresses) {

      CollectionReference addressCollection = database
          .collection(usersCollection)
          .doc(address.userId)
          .collection(addressesCollection);

      DocumentReference newAddressRef = addressCollection.doc();
      address.addressId = newAddressRef.id;

      await newAddressRef.set(address.toFirestore());

    }

  }

  Future<List<Address>> getAllUserAddresses(String userId) async {
    List<Address> addresses = [];

    CollectionReference addressCollectionReference = database
        .collection(usersCollection)
        .doc(userId)
        .collection(addressesCollection);

    QuerySnapshot snapshot = await addressCollectionReference.get();

    addresses = snapshot.docs.map((doc) {
      return Address.fromFirestore(doc.data() as Map<String, dynamic>);
    }).toList();

    return addresses;
  }

  Future<void> addNewAddress(Address address) async {

    CollectionReference addressCollection = database
        .collection(usersCollection)
        .doc(address.userId)
        .collection(addressesCollection);

    DocumentReference newAddressRef = addressCollection.doc();
    address.addressId = newAddressRef.id;

    await newAddressRef.set(address.toFirestore());
  }

  Future<Tuple2<bool, String>> deleteAddress(String userId, String addressId) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(usersCollection)
        .doc(userId)
        .collection(addressesCollection)
        .doc(addressId)
        .delete()
        .then((value) => debugPrint("Address Deleted Successfully"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> updateAddress(Address address) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(usersCollection)
        .doc(address.userId)
        .collection(addressesCollection)
        .doc(address.addressId)
        .update(address.toFirestore())
        .then((value) => debugPrint("Address Updated Successfully"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<void> createNewRatingForProduct(String productId, Rating rating) async {
    ProductRatings productRatings = createNewProductRatingFromRating(productId, rating);

    DocumentReference productRatingsReference = database.collection(ratingsCollection).doc(productId);

    DocumentSnapshot productRatingsSnapshot = await productRatingsReference.get();

    if (productRatingsSnapshot.exists) {
      Map<String, dynamic>? data = productRatingsSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        ProductRatings productRatings = ProductRatings.fromMap(data);

        if (productRatings.avgRating != null) {
          num total = productRatings.totalNumberOfRating?.toInt() ?? 0;
          num avgRating = productRatings.avgRating ?? 0.0;
          double updatedAvgRating = avgRating + rating.rating / total + 1;
          productRatings =
              updateProductRatingData(productRatings, updatedAvgRating, rating);
        }
      }
    }

    await database
        .colletion(ratingsCollection)
        .doc(productId)
        .set(productRatings.toFirestore());
  }

  Future<ProductRatings> fetchRatingsForProduct(String productId) async {

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await database
        .collection(ratingsCollection)
        .doc(productId)
        .get();

    return ProductRatings.fromFirestore(documentSnapshot);
  }

  Future<String> getStripeSecretKey() async {

    DocumentSnapshot<Map<String, dynamic>> snapshot = await database
        .collection(credentialsCollection)
        .doc("Stripe Secret Key")
        .get();

    return snapshot["secret_key"];
  }

}