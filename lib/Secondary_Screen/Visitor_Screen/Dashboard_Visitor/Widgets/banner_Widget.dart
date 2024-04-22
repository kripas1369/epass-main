import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Widgets/sizebox.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ads',
          style: TextStyle(
            color: Color(0xFF090A0A),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        SmallSizedBox(),
        Container(
          width: 382,
          height: 120,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(AppImages.appbarLogo),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFF4F4F4)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: BannerCarousel.fullScreen(
            activeColor: Colors.blueAccent,
            banners: BannerImages.listBanners,
            height: 120,
            animation: false,

            initialPage: 1,
            // OR pageController: PageController(initialPage: 6),
          ),
        ),
      ],
    );
  }
}

class BannerImages {
  static const String banner1 =
      "https://img.freepik.com/premium-vector/futuristic-technology-connection-banner-design_1055-8032.jpg";
  static const String banner2 =
      "https://i.pinimg.com/736x/bf/fc/bb/bffcbb3c0a5f66158141ae3e6c89bf11.jpg";
  static const String banner3 = "https://wallpaperaccess.com/full/19921.jpg";
  static const String banner4 =
      "https://www.macropusglobal.com/wp-content/uploads/2017/05/information-technology-banner-300x126.jpg";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}
