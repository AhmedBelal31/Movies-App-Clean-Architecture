import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildShimmerEffectItem(
                    height: 20,
                    width: screenWidth / 3,
                  ),
                  const SizedBox(height: 10),
                  buildShimmerEffectItem(
                    height: 35,
                    width: screenWidth / 1.5,
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        buildShimmerEffectItem(height: 18, width: screenWidth),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 5),
                    itemCount: 5,
                  ),
                  const SizedBox(height: 20),
                  buildShimmerEffectItem(
                    height: 35,
                    width: screenWidth / 1.1,
                  ),
                  const SizedBox(height: 20),
                  buildShimmerEffectItem(
                    height: 35,
                    width: screenWidth / 2,
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.35,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    itemCount: 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildShimmerEffectItem({double width = 30, double height = 90}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
    );
  }
}