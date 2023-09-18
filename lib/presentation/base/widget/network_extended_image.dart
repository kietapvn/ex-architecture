import 'package:example_architecture/presentation/base/theme/color/color_andpad.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkExtendedImage extends StatelessWidget {
  const NetworkExtendedImage(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.cache,
  });

  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool? cache;

  @override
  Widget build(BuildContext context) {
    if (url?.isNotEmpty ?? false) {
      return ExtendedImage.network(
        url!,
        cache: cache ?? true,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return Shimmer.fromColors(
                baseColor: AndpadColors.shimmerBaseColor,
                highlightColor: AndpadColors.shimmerHighlight,
                child: Container(
                  width: width,
                  height: height,
                  color: AndpadColors.shimmerBaseColor,
                ),
              );

            ///if you don't want override completed widget
            ///please return null or state.completedWidget
            //return null;
            //return state.completedWidget;
            case LoadState.completed:
              return ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                fit: fit ?? BoxFit.cover,
                width: width,
                height: height,
              );
            case LoadState.failed:
              return Container(
                color: AndpadColors.shimmerBaseColor,
              );
          }
        },
      );
    } else {
      return Container(
        color: AndpadColors.shimmerBaseColor,
      );
    }
  }
}
