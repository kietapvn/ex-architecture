import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool showIndicator;

  const LoadingWidget({
    super.key,
    required this.child,
    this.isLoading = false,
    this.showIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: isLoading ? 0.5 : 1,
          child: AbsorbPointer(
            absorbing: isLoading,
            child: child,
          ),
        ),
        if (isLoading && showIndicator)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
