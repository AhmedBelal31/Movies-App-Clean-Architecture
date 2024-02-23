import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildCustomLoading() {
  return FadeIn(
    duration: const Duration(milliseconds: 500),
    child: SizedBox(
      height: 170.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
