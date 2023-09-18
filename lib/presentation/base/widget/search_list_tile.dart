import 'package:example_architecture/gen/assets.gen.dart';
import 'package:example_architecture/presentation/base/theme/color/color_andpad.dart';
import 'package:example_architecture/presentation/base/theme/type/text_styles.dart';
import 'package:flutter/material.dart';

class SearchListTile extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchListTile({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AndpadColors.border,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '工事名',
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusColor: AndpadColors.labelHint,
              hoverColor: AndpadColors.labelHint,
              contentPadding: const EdgeInsets.all(4),
              fillColor: AndpadColors.textToolTip,
              filled: true,
              hintStyle: const TextStyle(
                color: AndpadColors.borderHighLight,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8, top: 14, bottom: 14),
                child: Assets.images.search.svg(
                  width: 14,
                  height: 14,
                ),
              ),
            ),
            onChanged: onChanged,
            style: AndpadTextStyles.body1,
          ),
        ),
      ],
    );
  }
}
