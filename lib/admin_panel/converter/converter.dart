import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/admin_panel/models/MiscellaneousDataModel.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/admin_panel/models/TopSellersModel.dart';
import 'package:flick/admin_panel/models/referrals/referral_data.dart';
import 'package:flick/admin_panel/models/referrals/ui_related_referral_data.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';

class Converter {

  static List<TopSellersModel> convertUserToTopSellerModel(List<User> topSellers) {
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
        title: "X",
        count: referralData.twitterReferralsCount,
        svgSrc: "assets/images/referrals_apps/x.png",
        color: blackColor,
        hasSvgIcon: false
      ),
      ReferralInfoModel(
        title: "Linkedin",
        count: referralData.linkedinReferralsCount,
        svgSrc: "assets/icons/Linkedin.svg",
        color: adminPanelPrimaryColor,
      ),
      ReferralInfoModel(
        title: "Others",
        count: referralData.otherReferralsCount,
        svgSrc: "assets/icons/Dribbble.svg",
        color: red,
      ),
    ];

    return UIRelatedReferralData(
        referralData.referralMessage, referralInfoModels);
  }

  static List<DetailsCardModel> convertMiscellaneousDataToDetailsCardModel(MiscellaneousDataModel miscellaneousData) {
    return [
      DetailsCardModel(
        title: "Users",
        count: miscellaneousData.totalUsers,
        svgSrc: "assets/icons/Subscribers.svg",
        color: adminPanelPrimaryColor,
      ),
      DetailsCardModel(
        title: "Products",
        count: miscellaneousData.totalProducts,
        svgSrc: "assets/icons/Post.svg",
        color: purple,
      ),
      DetailsCardModel(
        title: "Sales",
        count: miscellaneousData.totalSales,
        svgSrc: "assets/icons/Pages.svg",
        color: orange,
      ),
      DetailsCardModel(
        title: "Seller",
        count: miscellaneousData.totalSellers,
        svgSrc: "assets/icons/Comments.svg",
        color: green,
      ),
    ];
  }

}