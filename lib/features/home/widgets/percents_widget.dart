import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/theming/fonts.dart';
import '../../../core/theming/my_colors.dart';

class PercentsWidget extends StatelessWidget {
  const PercentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0,
          lineWidth: 12.0,
          percent: 1.0,
          center: Text(
            "100%",
            style: FontHelper.font18BoldWhite,
          ),
          footer: Text(
            "Bills",
            style: FontHelper.font18BoldWhite,
          ),
          progressColor: MyColors.orangeColor,
        ),
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0,
          lineWidth: 12.0,
          percent: 0.25,
          center: Text(
            "25%",
            style: FontHelper.font18BoldWhite,
          ),
          footer: Text(
            "Internet",
            style: FontHelper.font18BoldWhite,
          ),
          progressColor: Colors.green,
        ),
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0,
          lineWidth: 12.0,
          percent: 0.8,
          center: Text(
            "80%",
            style: FontHelper.font18BoldWhite,
          ),
          footer: Text(
            "Food",
            style: FontHelper.font18BoldWhite,
          ),
          progressColor: Colors.blue,
        ),
      ],
    );
  }
}