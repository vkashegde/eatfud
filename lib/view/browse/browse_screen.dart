import 'package:eatfud/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/textStyles.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List categories = [
    ['assets/categories/alcohol.png', 'Alcohol'],
    ['assets/categories/american.png', 'American'],
    ['assets/categories/asian.png', 'Asian'],
    ['assets/categories/carrebian.png', 'Carrebian'],
    ['assets/categories/chinese.png', 'Chinese'],
    ['assets/categories/convenience.png', 'Convience'],
    ['assets/categories/dessert.png', 'Dessert'],
    ['assets/categories/fastFood.png', 'Fast Food'],
    ['assets/categories/flower.png', 'Flower'],
    ['assets/categories/french.png', 'French'],
    ['assets/categories/grocery.png', 'Grocery'],
    ['assets/categories/halal.png', 'Halal'],
    ['assets/categories/icecream.png', 'Ice cream'],
    ['assets/categories/indian.png', 'Indian'],
    ['assets/categories/petSupplies.png', 'Pet Supplies'],
    ['assets/categories/retails.png', 'Retails'],
    ['assets/categories/ride.png', 'Ride'],
    ['assets/categories/takeout.png', 'Takeout'],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          SizedBox(
            height: 3.h,
          ),
          Text(
            'All Categories',
            style: AppTextStyles.body16,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 3.h,
          ),
          GridView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          color: greyShade3),
                      child: Image(
                        image: AssetImage(categories[index][0]),
                      ),
                    )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      categories[index][1],
                      style: AppTextStyles.small10Bold,
                    )
                  ],
                );
              })
        ],
      )),
    );
  }
}
