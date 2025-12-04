import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rating extends StatelessWidget {
  final bool isDark;

  const Rating({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    //     final items = [
    //   {
    //     "image": "assets/image 12.png",
    //   },
    //   {
    //     "image": "assets/image 12.png",
    //   },
    //   {
    //     "image": "assets/image 12.png",
    //   },
    //         {
    //     "image": "assets/image 12.png",
    //   },
    //         {
    //     "image": "assets/image 12.png",
    //   },
    // ];

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: isMobile ? 600.h : 777.h,
        width: double.infinity,
      
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "اراء مرضانا لماذا يثقون بنا لابتساماتهم؟",
                style: TextStyle(
                  fontFamily: "WorkSans",
                  fontSize: isMobile ? 60.sp : 26.sp,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
    
      
              SizedBox(height: 30.h),
      SizedBox(
        height:isMobile?400.h: 500.h, 
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      
      itemCount: 7,
      itemBuilder: (context, index) {
        return Row(
          children: [
          Image.asset("assets/rating/${index+1}.jpg"),
            SizedBox(width: isMobile ? 20.w : 30.w),
          ],
        );
      },
        ),
      ),
      
      
            ],
          ),
        ),
      ),
    );
  }
}
