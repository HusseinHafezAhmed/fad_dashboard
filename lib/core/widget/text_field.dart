// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/my_colors.dart';

class MyTextField {
  static draw(
    onchange,
    controller,
    context,
    hint, {
    bool canArabic = false,
    bool onlyNumber = false,
    int multiLine = 1,
    title,
    suffix,
    prefix,
    double borderWidth = 1.0,
    border = 6.0,
    double height = 50,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: multiLine * 50.0,
            child: Center(
              child: Container(
                height: multiLine * 50.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderWidth < 1 ? Colors.transparent : Colors.grey,
                    width: borderWidth,
                  ),
                  color: MyColors.darkGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      double.parse(
                        border.toString(),
                      ),
                    ),
                  ),
                ),
                child: Directionality(
                  textDirection:
                      Localizations.localeOf(context).countryCode == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                  child: TextFormField(
                    minLines: 5,
                    maxLines: 50,
                    controller: controller,
                    textInputAction: multiLine > 1
                        ? TextInputAction.newline
                        : TextInputAction.next,
                    keyboardType:
                        onlyNumber ? TextInputType.number : TextInputType.name,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: <TextInputFormatter>[
                      canArabic
                          ? FilteringTextInputFormatter.deny(
                              RegExp('[]'),
                            )
                          : FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z0-9-() ]'),
                            ),
                    ],
                    validator: (value) {
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    enableSuggestions: true,
                    onChanged: onchange ?? (value) {},
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      hintText: hint,
                      hintStyle: const TextStyle(
                        fontSize: 10,
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(maxWidth: 104, minHeight: 50),
                      prefixIcon: prefix ?? null,
                      suffixIcon: suffix ?? null,
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
