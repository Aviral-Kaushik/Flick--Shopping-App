import 'dart:convert';

import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/admin_panel/models/TopSellersModel.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/models/Message.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';

List<DetailsCardModel> detailsCardData = [
  DetailsCardModel(
    title: "Subscribers",
    count: 720,
    svgSrc: "assets/icons/Subscribers.svg",
    color: adminPanelPrimaryColor,
  ),
  DetailsCardModel(
    title: "Post",
    count: 820,
    svgSrc: "assets/icons/Post.svg",
    color: purple,
  ),
  DetailsCardModel(
    title: "Pages",
    count: 920,
    svgSrc: "assets/icons/Pages.svg",
    color: orange,
  ),
  DetailsCardModel(
    title: "Comments",
    count: 920,
    svgSrc: "assets/icons/Comments.svg",
    color: green,
  ),
];

List<TopSellersModel> topSellersData = [
  TopSellersModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Lutfhi Chan",
    date: "Jan 25,2021",
  ),
  TopSellersModel(
    imageSrc: "assets/images/photo2.jpg",
    name: "Devi Carlos",
    date: "Jan 25,2021",
  ),
  TopSellersModel(
    imageSrc: "assets/images/photo3.jpg",
    name: "Danar Comel",
    date: "Jan 25,2021",
  ),
  TopSellersModel(
    imageSrc: "assets/images/photo4.jpg",
    name: "Karin Lumina",
    date: "Jan 25,2021",
  ),
  TopSellersModel(
    imageSrc: "assets/images/photo5.jpg",
    name: "Fandid Deadan",
    date: "Jan 25,2021",
  ),
  TopSellersModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Avichal Kaushik",
    date: "Jan 25,2021",
  ),
];

List<ReferralInfoModel> referralData = [
  ReferralInfoModel(
    title: "Facebook",
    count: 234,
    svgSrc: "assets/icons/Facebook.svg",
    color: adminPanelPrimaryColor,
  ),
  ReferralInfoModel(
    title: "Twitter",
    count: 234,
    svgSrc: "assets/icons/Twitter.svg",
    color: adminPanelPrimaryColor,
  ),
  ReferralInfoModel(
    title: "Linkedin",
    count: 234,
    svgSrc: "assets/icons/Linkedin.svg",
    color: adminPanelPrimaryColor,
  ),

  ReferralInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/Dribbble.svg",
    color: red,
  ),
];

String termsAndCondition = """Welcome to Flick! These Terms and Conditions ("Terms") govern your use of our eCommerce application ("Flick" or the "App"). By accessing or using the App, you agree to comply with and be bound by these Terms. If you do not agree to these Terms, please do not use the App.

1. Use of the App
1.1 You must be at least 18 years old to use Flick. By using the App, you represent and warrant that you meet this age requirement.
1.2 You agree to use the App only for lawful purposes and in accordance with these Terms.
1.3 You are responsible for maintaining the confidentiality of your account information and password. You agree to accept responsibility for all activities that occur under your account.

2. Accounts and Registration
2.1 To access certain features of the App, you may need to register for an account. You agree to provide accurate and complete information during registration and to update such information as needed.
2.2 We reserve the right to suspend or terminate your account if any information provided during registration is found to be inaccurate, false, or misleading.

3. Orders and Payments
3.1 All orders placed through the App are subject to our acceptance. We may refuse or cancel any order at any time for any reason.
3.2 Prices and availability of products are subject to change without notice.
3.3 By placing an order, you agree to pay the specified price for the products, including any applicable taxes and shipping fees.

4. Returns and Refunds
4.1 Our return and refund policy is detailed here [Insert link to the return policy]. By using the App, you agree to comply with this policy.

5. Intellectual Property
5.1 All content on the App, including text, graphics, logos, images, and software, is the property of Flick or its licensors and is protected by intellectual property laws.
5.2 You may not use, reproduce, distribute, or create derivative works from any content on the App without our prior written permission.

6. Prohibited Activities
6.1 You agree not to engage in any of the following prohibited activities:
- Violating any applicable laws or regulations.
- Infringing on the intellectual property rights of others.
- Uploading or transmitting viruses or other harmful code.
- Engaging in any activity that disrupts or interferes with the App's functionality.

7. Limitation of Liability
7.1 To the maximum extent permitted by law, Flick shall not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App.

8. Indemnification
8.1 You agree to indemnify and hold harmless Flick, its affiliates, and its respective officers, directors, employees, and agents from any claims, liabilities, damages, losses, and expenses arising out of or in connection with your use of the App or violation of these Terms.

9. Changes to the Terms
9.1 We may update these Terms from time to time. We will notify you of any changes by posting the new Terms on the App. Your continued use of the App after any such changes constitutes your acceptance of the new Terms.

10. Governing Law
10.1 These Terms shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.

Contact Us
If you have any questions about these Terms, please contact us at [support@flick.com].""";

String privacyPolicy = """Flick ("we", "our", or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and disclose information about you when you use our eCommerce application ("Flick" or the "App").

1. Information We Collect
1.1 We collect information that you provide directly to us, such as when you create an account, place an order, or contact us for support. This information may include your name, email address, phone number, shipping address, and payment information.
1.2 We automatically collect certain information when you use the App, such as your IP address, device information, browser type, and usage data.

2. How We Use Your Information
2.1 We use the information we collect to:
- Provide, maintain, and improve the App.
- Process transactions and send you related information, such as order confirmations and invoices.
- Communicate with you, including responding to your comments, questions, and requests.
- Send you technical notices, updates, security alerts, and support messages.
- Personalize your experience and provide advertisements, content, or features that match your interests.

3. Sharing Your Information
3.1 We may share your information with third-party service providers who perform services on our behalf, such as payment processing, shipping, and customer support.
3.2 We may disclose your information if required to do so by law or in response to a valid request from a law enforcement authority.

4. Data Security
4.1 We implement appropriate technical and organizational measures to protect your information from unauthorized access, loss, misuse, or alteration.
4.2 However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee the absolute security of your information.

5. Your Choices
5.1 You may update or delete your account information at any time by logging into your account and making the necessary changes.
5.2 You may opt-out of receiving promotional communications from us by following the instructions in those communications or by contacting us at [support@flick.com].

6. Children's Privacy
6.1 Flick is not intended for use by individuals under the age of 18. We do not knowingly collect personal information from children under 18. If we become aware that we have collected personal information from a child under 18, we will take steps to delete such information.

7. Changes to This Privacy Policy
7.1 We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on the App. Your continued use of the App after any such changes constitutes your acceptance of the new Privacy Policy.

8. Contact Us
If you have any questions about this Privacy Policy, please contact us at [support@flick.com].
""";

List<User> getTopSellerUsersData() {
  List<User> usersList = [];

  String jsonDat = """
[
  {
    "id": "1",
    "username": "john_doe",
    "password": "password123",
    "email": "john.doe@example.com",
    "name": "John Doe",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "01-05-2024",
    "profilePhoto": "assets/images/photo1.jpg",
    "country": "USA"
  },
  {
    "id": "2",
    "username": "jane_smith",
    "password": "pass456",
    "email": "jane.smith@example.com",
    "name": "Jane Smith",
    "device": "iOS",
    "isAdmin": true,
    "joiningDate": "01-18-2024",
    "profilePhoto": "assets/images/photo2.jpg",
    "country": "Canada"
  },
  {
    "id": "3",
    "username": "alex_jones",
    "password": "alex789",
    "email": "alex.jones@example.com",
    "name": "Alex Jones",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "02-07-2024",
    "profilePhoto": "assets/images/photo3.jpg",
    "country": "UK"
  },
  {
    "id": "4",
    "username": "emma_watson",
    "password": "emma234",
    "email": "emma.watson@example.com",
    "name": "Emma Watson",
    "device": "iOS",
    "isAdmin": false,
    "joiningDate": "02-15-2024",
    "profilePhoto": "assets/images/photo4.jpg",
    "country": "Australia"
  },
  {
    "id": "5",
    "username": "michael_brown",
    "password": "mike567",
    "email": "michael.brown@example.com",
    "name": "Michael Brown",
    "device": "Android",
    "isAdmin": true,
    "joiningDate": "03-03-2024",
    "profilePhoto": "assets/images/photo5.jpg",
    "country": "Germany"
  },{
    "id": "26",
    "username": "avichal1106",
    "password": "avi1106",
    "email": "avichalkaushik0007@gmail.com",
    "name": "Avichal Kaushik",
    "device": "Android",
    "isAdmin": true,
    "joiningDate": "04-16-2024",
    "profilePhoto": "assets/images/photo1.jpg",
    "country": "India"
  }]""";

  List<dynamic> decodedUsersData = jsonDecode(jsonDat);

  for (var userData in decodedUsersData) {
    usersList.add(User.fromJson(userData as Map<String, dynamic>));
  }

  return usersList;
}

List<User> getUsersData() {
  List<User> usersList = [];

//   String jsonData = """[{"id":"1","username":"ewerendell0","password":"123456","email":"ewerendell0@yandex.ru","name":"Ella Werendell","device":"Android","isAdmin":true,"joiningDate":"09-17-2023","profilePhoto":"assets/images/photo1.jpg","country":"Russia"},
// {"id":"2","username":"psauter1","password":"123456","email":"psauter1@gov.uk","name":"Peria Sauter","device":"iOS","isAdmin":true,"joiningDate":"07-27-2023","profilePhoto":"assets/images/photo5.jpg","country":"Thailand"},
// {"id":"3","username":"jphillipp2","password":"123456","email":"jphillipp2@deviantart.com","name":"Jobye Phillipp","device":"iOS","isAdmin":false,"joiningDate":"07-21-2023","profilePhoto":"assets/images/photo6.jpg","country":"Philippines"},
// {"id":"4","username":"dhawse3","password":"123456","email":"dhawse3@printfriendly.com","name":"Donnajean Hawse","device":"Android","isAdmin":false,"joiningDate":"09-16-2023","profilePhoto":"assets/images/photo2.jpg","country":"Marshall Islands"},
// {"id":"5","username":"lrandalson4","password":"123456","email":"lrandalson4@merriam-webster.com","name":"Linda Randalson","device":"Android","isAdmin":false,"joiningDate":"11-07-2023","profilePhoto":"assets/images/photo3.jpg","country":"Brazil"},
// {"id":"6","username":"omcgrath5","password":"123456","email":"omcgrath5@gravatar.com","name":"Ogdan McGrath","device":"Android","isAdmin":false,"joiningDate":"07-29-2023","profilePhoto":"assets/images/photo6.jpg","country":"Poland"},
// {"id":"7","username":"bsteutly6","password":"123456","email":"bsteutly6@booking.com","name":"Ban Steutly","device":"Android","isAdmin":true,"joiningDate":"06-04-2023","profilePhoto":"assets/images/photo4.jpg","country":"Somalia"},
// {"id":"8","username":"owestphal7","password":"123456","email":"owestphal7@altervista.org","name":"Olivia Westphal","device":"iOS","isAdmin":true,"joiningDate":"05-05-2024","profilePhoto":"assets/images/photo5.jpg","country":"Russia"},
// {"id":"9","username":"snixon8","password":"123456","email":"snixon8@ameblo.jp","name":"Sarajane Nixon","device":"iOS","isAdmin":false,"joiningDate":"03-16-2024","profilePhoto":"assets/images/photo4.jpg","country":"China"},
// {"id":"10","username":"rfanning9","password":"123456","email":"rfanning9@disqus.com","name":"Rosamond Fanning","device":"iOS","isAdmin":false,"joiningDate":"09-25-2023","profilePhoto":"assets/images/photo6.jpg","country":"China"}]""";

  String jsonDat = """
[
  {
    "id": "1",
    "username": "john_doe",
    "password": "password123",
    "email": "john.doe@example.com",
    "name": "John Doe",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "01-05-2024",
    "profilePhoto": "assets/images/photo1.jpg",
    "country": "USA"
  },
  {
    "id": "2",
    "username": "jane_smith",
    "password": "pass456",
    "email": "jane.smith@example.com",
    "name": "Jane Smith",
    "device": "iOS",
    "isAdmin": true,
    "joiningDate": "01-18-2024",
    "profilePhoto": "assets/images/photo2.jpg",
    "country": "Canada"
  },
  {
    "id": "3",
    "username": "alex_jones",
    "password": "alex789",
    "email": "alex.jones@example.com",
    "name": "Alex Jones",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "02-07-2024",
    "profilePhoto": "assets/images/photo3.jpg",
    "country": "UK"
  },
  {
    "id": "4",
    "username": "emma_watson",
    "password": "emma234",
    "email": "emma.watson@example.com",
    "name": "Emma Watson",
    "device": "iOS",
    "isAdmin": false,
    "joiningDate": "02-15-2024",
    "profilePhoto": "assets/images/photo4.jpg",
    "country": "Australia"
  },
  {
    "id": "5",
    "username": "michael_brown",
    "password": "mike567",
    "email": "michael.brown@example.com",
    "name": "Michael Brown",
    "device": "Android",
    "isAdmin": true,
    "joiningDate": "03-03-2024",
    "profilePhoto": "assets/images/photo5.jpg",
    "country": "Germany"
  },
  {
    "id": "6",
    "username": "sarah_johnson",
    "password": "sarah890",
    "email": "sarah.johnson@example.com",
    "name": "Sarah Johnson",
    "device": "iOS",
    "isAdmin": false,
    "joiningDate": "03-12-2024",
    "profilePhoto": "assets/images/photo6.jpg",
    "country": "France"
  },
  {
    "id": "7",
    "username": "david_lee",
    "password": "david123",
    "email": "david.lee@example.com",
    "name": "David Lee",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "03-20-2024",
    "profilePhoto": "assets/images/photo1.jpg",
    "country": "China"
  },
  {
    "id": "8",
    "username": "linda_wilson",
    "password": "linda456",
    "email": "linda.wilson@example.com",
    "name": "Linda Wilson",
    "device": "iOS",
    "isAdmin": true,
    "joiningDate": "04-05-2024",
    "profilePhoto": "assets/images/photo2.jpg",
    "country": "Japan"
  },
  {
    "id": "9",
    "username": "daniel_clark",
    "password": "daniel789",
    "email": "daniel.clark@example.com",
    "name": "Daniel Clark",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "04-18-2024",
    "profilePhoto": "assets/images/photo3.jpg",
    "country": "South Korea"
  },
  {
    "id": "10",
    "username": "susan_martin",
    "password": "susan234",
    "email": "susan.martin@example.com",
    "name": "Susan Martin",
    "device": "iOS",
    "isAdmin": false,
    "joiningDate": "05-10-2024",
    "profilePhoto": "assets/images/photo4.jpg",
    "country": "Italy"
  },
  {
    "id": "11",
    "username": "james_roberts",
    "password": "james567",
    "email": "james.roberts@example.com",
    "name": "James Roberts",
    "device": "Android",
    "isAdmin": true,
    "joiningDate": "05-22-2024",
    "profilePhoto": "assets/images/photo5.jpg",
    "country": "Spain"
  },
  {
    "id": "12",
    "username": "patricia_hall",
    "password": "patricia890",
    "email": "patricia.hall@example.com",
    "name": "Patricia Hall",
    "device": "iOS",
    "isAdmin": false,
    "joiningDate": "06-04-2024",
    "profilePhoto": "assets/images/photo6.jpg",
    "country": "Netherlands"
  },
  {
    "id": "13",
    "username": "robert_walker",
    "password": "robert123",
    "email": "robert.walker@example.com",
    "name": "Robert Walker",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "06-16-2024",
    "profilePhoto": "assets/images/photo1.jpg",
    "country": "Sweden"
  },
  {
    "id": "14",
    "username": "lisa_hernandez",
    "password": "lisa456",
    "email": "lisa.hernandez@example.com",
    "name": "Lisa Hernandez",
    "device": "iOS",
    "isAdmin": true,
    "joiningDate": "07-08-2024",
    "profilePhoto": "assets/images/photo2.jpg",
    "country": "Mexico"
  },
  {
    "id": "15",
    "username": "mark_wright",
    "password": "mark789",
    "email": "mark.wright@example.com",
    "name": "Mark Wright",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "07-20-2024",
    "profilePhoto": "assets/images/photo3.jpg",
    "country": "Brazil"
  },
  {
    "id": "16",
    "username": "anna_miller",
    "password": "anna123",
    "email": "anna.miller@example.com",
    "name": "Anna Miller",
    "device": "iOS",
    "isAdmin": false,
    "joiningDate": "08-05-2024",
    "profilePhoto": "assets/images/photo4.jpg",
    "country": "Russia"
  },
  {
    "id": "17",
    "username": "tom_clarkson",
    "password": "tom456",
    "email": "tom.clarkson@example.com",
    "name": "Tom Clarkson",
    "device": "Android",
    "isAdmin": true,
    "joiningDate": "08-17-2024",
    "profilePhoto": "assets/images/photo5.jpg",
    "country": "India"
  },
  {
    "id": "18",
    "username": "emma_williams",
    "password": "emma789",
    "email": "emma.williams@example.com",
    "name": "Emma Williams",
    "device": "iOS",
    "isAdmin": false,
    "joiningDate": "09-09-2024",
    "profilePhoto": "assets/images/photo6.jpg",
    "country": "Argentina"
  },
  {
    "id": "19",
    "username": "jack_johnson",
    "password": "jack234",
    "email": "jack.johnson@example.com",
    "name": "Jack Johnson",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "09-21-2024",
    "profilePhoto": "assets/images/photo1.jpg",
    "country": "South Africa"
  },
  {
    "id": "20",
    "username": "olivia_brown",
    "password": "olivia567",
    "email": "olivia.brown@example.com",
    "name": "Olivia Brown",
    "device": "iOS",
    "isAdmin": true,
    "joiningDate": "10-04-2024",
    "profilePhoto": "assets/images/photo2.jpg",
    "country": "Turkey"
  },
  {
    "id": "21",
    "username": "lucas_garcia",
    "password": "lucas890",
    "email": "lucas.garcia@example.com",
    "name": "Lucas Garcia",
    "device": "Android",
    "isAdmin": false,
    "joiningDate": "10-19-2024",
    "profilePhoto": "assets/images/photo3.jpg",
    "country": "India"
   },
   {
    "id":"22",
    "username":"ewerendell0",
    "password":"123456",
    "email":"ewerendell0@yandex.ru",
    "name":"Ella Werendell",
    "device":"Android",
    "isAdmin":true,
    "joiningDate":"09-17-2023",
    "profilePhoto":"assets/images/photo1.jpg",
    "country":"Russia"
   },
   {
    "id":"23",
    "username":"psauter1",
    "password":"123456",
    "email":"psauter1@gov.uk",
    "name":"Peria Sauter",
    "device":"iOS",
    "isAdmin":true,
    "joiningDate":"07-27-2023",
    "profilePhoto":"assets/images/photo5.jpg",
    "country":"Thailand"
   },
   {
    "id":"24",
    "username":"bsteutly6",
    "password":"123456",
    "email":"bsteutly6@booking.com",
    "name":"Ban Steutly",
    "device":"Android",
    "isAdmin":true,
    "joiningDate":"12-04-2023",
    "profilePhoto":
    "assets/images/photo4.jpg",
    "country":"Somalia"
   },
   {
    "id":"25",
    "username":"owestphal7",
    "password":"123456",
    "email":"owestphal7@altervista.org",
    "name":"Olivia Westphal",
    "device":"iOS",
    "isAdmin":true,
    "joiningDate":"11-05-2024",
    "profilePhoto":"assets/images/photo5.jpg",
    "country":"Russia"
   },
   {
    "id": "26",
    "username": "avichal1106",
    "password": "avi1106",
    "email": "avichalkaushik0007@gmail.com",
    "name": "Avichal Kaushik",
    "device": "Android",
    "isAdmin": true,
    "joiningDate": "04-16-2024",
    "profilePhoto": "assets/images/photo1.jpg",
    "country": "India"
  }]""";

  List<dynamic> decodedUsersData = jsonDecode(jsonDat);

  for (var userData in decodedUsersData) {
    usersList.add(User.fromJson(userData as Map<String, dynamic>));
  }

  return usersList;
}

List<Message> getDummyMessages() {
  return [
    Message(id: "1", name: "Avichal Kaushik", contactEmail: "avichalkaushik0007@gmail.com", subject: "Become Seller at flick", message: "I want to be a new seller on flick and sell my products can you please specify the further process of becoming seller at flick", dateAndTime: DateTime.now().toString()),
    Message(id: "2", name: "Jobye Phillipp", contactEmail: "jphillipp2@deviantart.com", subject: "Need details of flick", message: "What is Flick?", dateAndTime: DateTime.now().toString()),
    Message(id: "3", name: "Ella Werendell", contactEmail: "ewerendell0@yandex.ru", subject: "Flick Working", message: "How does it work?", dateAndTime: DateTime.now().toString()),
    Message(id: "4", name: "Donnajean Hawse", contactEmail: "dhawse3@printfriendly.com", subject: "Nike Special Edition" , message: "When will new nike new limited edition will come?", dateAndTime: DateTime.now().toString()),
    Message(id: "5", name: "Ban Steutly", contactEmail: "bsteutly6@booking.com", subject: "Electronic reference" , message: "Does you deals in electronics?", dateAndTime: DateTime.now().toString()),
    Message(id: "6", name: "Rosamond Fanning", contactEmail: "rfanning9@disqus.com", subject: "Sale information" , message: "When will the special festiv sale will come?", dateAndTime: DateTime.now().toString())
  ];
}


String referralMessageFromFirebase =  "Flick is an innovative e-commerce application designed to revolutionize online shopping experiences. With a sleek interface and user-friendly features, Flick empowers users to browse, discover, and purchase products effortlessly.";


int facebookReferralsCountFromFirebase = 240;
int twitterReferralsCountFromFirebase = 195;
int linkedinReferralsCountFromFirebase = 135;
int othersReferralsCountFromFirebase = 95;


List<Product> getDummyProducts() {
  return [
    Product(
      id: "1",
      productName: "Zoom Freak",
      productDescription:
          "The forward-thinking design of his latest signature shoe",
      productImages: ["lib/images/zoom_freak.png"],
      productRating: 4.5,
      productPrice: 236,
      totalPurchases: 415,
      stock: 153,
      sellerName: "Danar Comel",
      productFeatures: [""],
      productCategory: 'Sneakers',
      availableColors: [],
    ),

    Product(
      id: "2",
      productName: "Air Jordan",
      productDescription:
          "You\'ve got the hops and the speed lace up that enhances.",
      productImages: ["lib/images/air_jordan.png"],
      productRating: 3,
      productPrice: 220,
      totalPurchases: 317,
      stock: 217,
      sellerName: "Lutfhi Chan",
      productFeatures: [""],
      productCategory: 'Sneakers',
      availableColors: [],
    ),

    Product(
      id: "3",
      productName: "KD Treys",
      productDescription:
          "A secure midfoot strap is suited for scoring binges and defensive",
      productImages: ["lib/images/kd_treys.png"],
      productRating: 4,
      productPrice: 240,
      totalPurchases: 153,
      stock: 57,
      sellerName: "Devi Carlos",
      productFeatures: [""],
      productCategory: 'Sneakers',
      availableColors: [],
    ),

    Product(
      id: "4",
      productName: "Kyrie 6",
      productDescription:
          "Bouncy cushioning is paired with soft yet supportive foam.",
      productImages: ["lib/images/kyrie.jpeg"],
      productRating: 3.5,
      productPrice: 190,
      totalPurchases: 267,
      stock: 35,
      sellerName: "Karin Lumina",
      productFeatures: [""],
      productCategory: 'Sneakers',
      availableColors: [],
    ),

    Product(
      id: "5",
      productName: "Nike",
      productDescription:
          "Designed for comfortable wear for sports and street style, NIKE is always fun to wear. Upgrade in style with a wide range from the world’s leading and much-loved sports brand, NIKE.",
      productImages: ["lib/images/nike.png"],
      productRating: 4.5,
      productPrice: 399,
      totalPurchases: 357,
      stock: 295,
      sellerName: "Avichal Kaushik",
      productFeatures: [""],
      productCategory: 'Sneakers',
      availableColors: [],
    ),
  ];
}