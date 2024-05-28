import 'dart:convert';

import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/admin_panel/models/TopSellersModel.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
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

List topSellersData = [
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
    name: "Lutfhi Chan",
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

List<User> getUsersData() {
  List<User> usersList = [];

  String jsonData = """[{"id":"1","username":"ewerendell0","password":"123456","email":"ewerendell0@yandex.ru","name":"Ella Werendell","device":"Android","isAdmin":true,"joiningDate":"17-Oct-2023","profilePhoto":"assets/images/photo1.jpg","country":"Russia"},
{"id":"2","username":"psauter1","password":"123456","email":"psauter1@gov.uk","name":"Peria Sauter","device":"iOS","isAdmin":true,"joiningDate":"27-Jul-2023","profilePhoto":"assets/images/photo5.jpg","country":"Thailand"},
{"id":"3","username":"jphillipp2","password":"123456","email":"jphillipp2@deviantart.com","name":"Jobye Phillipp","device":"iOS","isAdmin":false,"joiningDate":"21-Jul-2023","profilePhoto":"assets/images/photo6.jpg","country":"Philippines"},
{"id":"4","username":"dhawse3","password":"123456","email":"dhawse3@printfriendly.com","name":"Donnajean Hawse","device":"Android","isAdmin":false,"joiningDate":"16-Oct-2023","profilePhoto":"assets/images/photo2.jpg","country":"Marshall Islands"},
{"id":"5","username":"lrandalson4","password":"123456","email":"lrandalson4@merriam-webster.com","name":"Linda Randalson","device":"Android","isAdmin":false,"joiningDate":"07-Nov-2023","profilePhoto":"assets/images/photo3.jpg","country":"Brazil"},
{"id":"6","username":"omcgrath5","password":"123456","email":"omcgrath5@gravatar.com","name":"Ogdan McGrath","device":"Android","isAdmin":false,"joiningDate":"29-Jul-2023","profilePhoto":"assets/images/photo6.jpg","country":"Poland"},
{"id":"7","username":"bsteutly6","password":"123456","email":"bsteutly6@booking.com","name":"Ban Steutly","device":"Android","isAdmin":true,"joiningDate":"04-Jun-2023","profilePhoto":"assets/images/photo4.jpg","country":"Somalia"},
{"id":"8","username":"owestphal7","password":"123456","email":"owestphal7@altervista.org","name":"Olivia Westphal","device":"iOS","isAdmin":true,"joiningDate":"05-May-2024","profilePhoto":"assets/images/photo5.jpg","country":"Russia"},
{"id":"9","username":"snixon8","password":"123456","email":"snixon8@ameblo.jp","name":"Sarajane Nixon","device":"iOS","isAdmin":false,"joiningDate":"16-Mar-2024","profilePhoto":"assets/images/photo4.jpg","country":"China"},
{"id":"10","username":"rfanning9","password":"123456","email":"rfanning9@disqus.com","name":"Rosamond Fanning","device":"iOS","isAdmin":false,"joiningDate":"25-Oct-2023","profilePhoto":"assets/images/photo6.jpg","country":"China"}]""";

  List<dynamic> decodedUsersData = jsonDecode(jsonData);

  for (var userData in decodedUsersData) {
    usersList.add(User.fromJson(userData as Map<String, dynamic>));
  }

  return usersList;
}