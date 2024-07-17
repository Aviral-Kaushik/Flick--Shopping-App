import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/admin_panel/models/TopSellersModel.dart';
import 'package:flick/admin_panel/models/referrals/referral_data.dart';
import 'package:flick/admin_panel/models/referrals/ui_related_referral_data.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';

class Converter {

  List<TopSellersModel> convertUserToTopSellerModel(List<User> topSellers) {
    List<TopSellersModel> topSellerModelList = [];

    topSellerModelList = topSellers.map((topSeller) {
      return TopSellersModel(
        name: topSeller.name,
        imageSrc: topSeller.profilePhoto,
        date: topSeller.joiningDate
      );
    }).toList();

    return topSellerModelList;
  }

  static UIRelatedReferralData convertReferralDataToUiRelatedReferralData(
      ReferralData referralData) {
    List<ReferralInfoModel> referralInfoModels = [

      ReferralInfoModel(
        title: "Facebook",
        count: referralData.facebookReferralsCount,
        svgSrc: "assets/icons/Facebook.svg",
        color: adminPanelPrimaryColor,
      ),
      ReferralInfoModel(
        title: "Twitter",
        count: referralData.twitterReferralsCount,
        svgSrc: "assets/icons/Twitter.svg",
        color: adminPanelPrimaryColor,
      ),
      ReferralInfoModel(
        title: "Linkedin",
        count: referralData.linkedinReferralsCount,
        svgSrc: "assets/icons/Linkedin.svg",
        color: adminPanelPrimaryColor,
      ),
      ReferralInfoModel(
        title: "Dribble",
        count: referralData.otherReferralsCount,
        svgSrc: "assets/icons/Dribbble.svg",
        color: red,
      ),
    ];

    return UIRelatedReferralData(
        referralData.referralMessage, referralInfoModels);
  }

}