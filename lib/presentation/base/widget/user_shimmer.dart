import 'package:example_architecture/presentation/base/theme/color/color_andpad.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class UserShimmer extends StatelessWidget {
  const UserShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: AndpadColors.shimmerBaseColor,
            highlightColor: AndpadColors.shimmerHighlight,
            child: const CircleAvatar(
              radius: 28,
              backgroundColor: AndpadColors.shimmerBaseColor,
            ),
          ),
          const Gap(8),
          Shimmer.fromColors(
            baseColor: AndpadColors.shimmerBaseColor,
            highlightColor: AndpadColors.shimmerHighlight,
            child: Container(
              height: 16,
              width: 64,
              color: AndpadColors.shimmerBaseColor,
            ),
          ),
        ],
      ),
    );
  }
}
