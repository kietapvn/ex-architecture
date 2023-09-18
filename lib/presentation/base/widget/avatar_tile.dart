import 'package:example_architecture/gen/assets.gen.dart';
import 'package:example_architecture/presentation/base/theme/color/color_andpad.dart';
import 'package:example_architecture/presentation/base/widget/network_extended_image.dart';
import 'package:flutter/material.dart';

class AvatarTile extends StatelessWidget {
  final String? url;
  final double? radius;
  const AvatarTile(
    this.url, {
    super.key,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return url?.isNotEmpty ?? false
        ? CircleAvatar(
            radius: radius,
            backgroundColor: AndpadColors.shimmerBaseColor,
            child: ClipOval(
              child: NetworkExtendedImage(url),
            ),
          )
        : CircleAvatar(
            radius: radius,
            backgroundColor: AndpadColors.shimmerBaseColor,
            child: Assets.images.user.svg(),
          );
  }
}
