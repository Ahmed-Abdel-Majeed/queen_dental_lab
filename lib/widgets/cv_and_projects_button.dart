import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_dental_lab/core/constant/string.dart';
import 'package:url_launcher/url_launcher.dart';

class CvAndProjectsButton extends StatelessWidget {
  final bool isDark;
  const CvAndProjectsButton({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Text(
            isMobile ? bio1 : bio,
            style: TextStyle(
              fontFamily: "WorkSans",
              fontSize: isMobile ? 50.sp : 18.sp,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            spacing: isMobile ? 80.w : 44.w,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  elevation: isMobile ? 5 : 12,
                  shadowColor: Colors.purpleAccent.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () async {
                  final url = Uri.parse(
                    'https://drive.google.com/uc?export=download&id=1pd-OeZwDwJ046uVqrphDDRXqACsHseuS',
                  );
                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw 'Could not launch $url';
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.download, color: Colors.white),
                      SizedBox(width: 5.w),
                      Text(
                        "Download RESUME",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: isMobile ? 44.sp : 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  elevation: isMobile ? 5 : 12,
                  shadowColor: Colors.purpleAccent.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () async {
                  final url = Uri.parse(
                    'https://github.com/Ahmed-Abdel-Majeed?tab=repositories',
                  );
                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw 'Could not launch $url';
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "Projects",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: isMobile ? 44.sp : 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
