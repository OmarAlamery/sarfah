import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/fonts.dart';
import '../../../core/theming/my_colors.dart';

class ExpenseTileWidget extends StatelessWidget {
  final String name;
  final String date;
  final String price;

  const ExpenseTileWidget({
    super.key,
    required this.name,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 41, 39, 78),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: FontHelper.font18BoldWhite,
                    ),
                    verticalSpace(10),
                    Text(
                      date,
                      style: FontHelper.font13WhiteW300,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Text(
                    "$price YR",
                    style: FontHelper.font18BoldWhite,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                color: MyColors.orangeColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
