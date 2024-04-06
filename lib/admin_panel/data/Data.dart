import 'package:flick/admin_panel/models/AnalyticInfoModel.dart';
import 'package:flick/admin_panel/models/DiscussionsInfoModel.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/utils/Colors.dart';

List analyticData = [
  AnalyticInfo(
    title: "Subscribers",
    count: 720,
    svgSrc: "assets/icons/Subscribers.svg",
    color: adminPanelPrimaryColor,
  ),
  AnalyticInfo(
    title: "Post",
    count: 820,
    svgSrc: "assets/icons/Post.svg",
    color: purple,
  ),
  AnalyticInfo(
    title: "Pages",
    count: 920,
    svgSrc: "assets/icons/Pages.svg",
    color: orange,
  ),
  AnalyticInfo(
    title: "Comments",
    count: 920,
    svgSrc: "assets/icons/Comments.svg",
    color: green,
  ),
];

List discussionData = [
  DiscussionInfoModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Lutfhi Chan",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo2.jpg",
    name: "Devi Carlos",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo3.jpg",
    name: "Danar Comel",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo4.jpg",
    name: "Karin Lumina",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo5.jpg",
    name: "Fandid Deadan",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Lutfhi Chan",
    date: "Jan 25,2021",
  ),
];

List referalData = [
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