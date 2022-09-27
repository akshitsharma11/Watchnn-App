import 'package:flutter/material.dart';
import 'package:watchn/core/constant/const.dart';

class DashDivider extends StatelessWidget {
  final double dashWidth;

  DashDivider({this.dashWidth = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashHeight = 0.5;
          final dashCount = (boxWidth / (1 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(
              dashCount,
              (__) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Const.kPerple),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
