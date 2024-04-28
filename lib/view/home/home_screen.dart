import 'package:carousel_slider/carousel_slider.dart';
import 'package:eatfud/controller/provider/restorent_provider/restorent_provider.dart';
import 'package:eatfud/model/restorent_model.dart';
import 'package:eatfud/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/textStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories = [
    ['assets/categories/convenience.png', 'Convience'],
    ['assets/categories/alcohol.png', 'Alcohol'],
    ['assets/categories/petSupplies.png', 'Per Supplies'],
    ['assets/categories/icecream.png', 'Ice Cream']
  ];
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Current Location",
              style: AppTextStyles.body16Bold,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: greyShade3),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "American",
                          style: AppTextStyles.small12Bold,
                        ),
                        const Image(
                            image: AssetImage('assets/categories/american.png'))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: greyShade3),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grocery",
                          style: AppTextStyles.small12Bold,
                        ),
                        const Image(
                            image: AssetImage('assets/categories/grocery.png'))
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((e) {
                return Column(
                  children: [
                    Container(
                      height: 22.w,
                      width: 22.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          color: greyShade3),
                      child: Image(
                        image: AssetImage(e[0]),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      e[1],
                      style: AppTextStyles.small10Bold,
                    )
                  ],
                );
              }).toList(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Divider(
              thickness: 1.h,
              color: greyShade3,
            ),
            SizedBox(
              height: 2.h,
            ),
            Consumer<RestorentProvider>(
                builder: (context, restorentProvider, child) {
              if (restorentProvider.restorents.isEmpty) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20.h,
                        width: 94.w,
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            color: greyShade3),
                      );
                    });
              } else {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: restorentProvider.restorents.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      RestaurantModel restorant =
                          restorentProvider.restorents[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 1.5.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.h, vertical: 2.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            border: Border.all(color: black87)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 23.h,
                                width: 94.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.sp),
                                  border: Border.all(color: greyShade3),
                                ),
                                child: CarouselSlider(
                                  carouselController: controller,
                                  options: CarouselOptions(
                                    height: 23.h,
                                    autoPlay: true,
                                    viewportFraction: 1,
                                  ),
                                  items: restorant.bannerImages!
                                      .map((img) => Container(
                                            width: 94.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(img),
                                                  fit: BoxFit.cover),
                                            ),
                                          ))
                                      .toList(),
                                )),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              restorant.restaurantName!,
                              style: AppTextStyles.body16,
                            )
                          ],
                        ),
                      );
                    });
              }
            })
          ],
        ),
      ),
    );
  }
}
