// ignore_for_file: missing_return, unnecessary_null_comparison, body_might_complete_normally_nullable, empty_catches
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyImage {
  static Widget? drawImage(String url,
      {double height = 100,
      double width = 100,
      Color? color,
      fit = BoxFit.fill,
      defaultUrl = "assets/images/logo.png",
      Widget? defaultDesign}) {
    try {
      if (url == null) {
        if (defaultDesign != null) {
          return defaultDesign;
        } else {
          if (defaultUrl.toLowerCase().endsWith(".svg")) {
            return SvgPicture.asset(
              defaultUrl,
              width: width,
              height: height,
              fit: BoxFit.contain,
            );
          } else {
            return Image.asset(
              defaultUrl,
              width: width,
              height: height,
              fit: fit,
            );
          }
        }
      } else {
        if (url.startsWith("http")) {
          if (url.toLowerCase().endsWith(".svg")) {
            return SvgPicture.network(
              url,
              width: width,
              height: height,
              fit: fit,
              placeholderBuilder: (context) => Image.asset(
                defaultUrl,
                height: height,
                width: width,
                fit: fit,
              ),
            );
          } else {
            return Image.network(
              url,
              width: width,
              height: height,
              fit: fit,
              loadingBuilder: (context, child, c) {
                if (c == null) return child;
                return const CircularProgressIndicator();
              },
              errorBuilder: (context, child, error) => Image.asset(
                defaultUrl,
                height: height,
                width: width,
                fit: fit,
              ),
            );
          }
        } else {
          if (url.toLowerCase().endsWith(".svg")) {
            return color == null
                ? SvgPicture.asset(
                    url,
                    width: width,
                    height: height,
                    fit: fit,
                    placeholderBuilder: (context) => Image.asset(
                      defaultUrl,
                      height: height,
                      width: width,
                      fit: fit,
                    ),
                  )
                : SvgPicture.asset(
                    url,
                    width: width,
                    height: height,
                    color: color,
                    fit: fit,
                    placeholderBuilder: (context) => Image.asset(
                      defaultUrl,
                      height: height,
                      width: width,
                      fit: fit,
                    ),
                  );
          } else if (url.startsWith("assets/images")) {
            return Image.asset(
              url,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (context, child, error) => Image.asset(
                defaultUrl,
                height: height,
                width: width,
                fit: fit,
              ),
            );
          } else {
            return Image.file(
              File(url),
              fit: fit,
              errorBuilder: (context, child, error) => Image.asset(
                defaultUrl,
                height: height,
                width: width,
                fit: fit,
              ),
            );
          }
        }
      }
    } catch (e) {}
  }

  static Widget drawClickableImage(String imageUrl,
      {adsId = '',
      double height = 100,
      double width = 100,
      fit = BoxFit.fill,
      defaultUrl = "assets/images/logo.png",
      Function? onTap}) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap as void Function(),
      child: drawImage(imageUrl,
          height: height, width: width, fit: fit, defaultUrl: defaultUrl),
    );
  }
}
