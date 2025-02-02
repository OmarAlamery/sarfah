import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/fonts.dart';
import '../../../core/theming/my_colors.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.navyColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Balance",
                style: FontHelper.font18BoldWhite,
              ),
              verticalSpace(5),
              Text(
                "70,000 YR",
                style: FontHelper.font28SemiBoldWhite,
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: MyColors.yellowColor,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              color: Colors.white,
              // iconSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
