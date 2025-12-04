import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_dental_lab/widgets/why_choose_us.dart';

class SkillsSection extends StatelessWidget {
  final bool isDark;

  const SkillsSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;
    final bool isTablet = screenWidth >= 800 && screenWidth < 1200;

    final items = [
      {
        "icon": Icons.verified_user_rounded,
        "title": "خبرة أكثر من 10 سنوات",
        "text": "أكثر من 10 سنوات من الخبرة في التركيبات السنية",
      },
      {
        "icon": Icons.science_rounded,
        "title": "أحدث المواد والتقنيات",
        "text": "نستخدم أحدث المواد والتقنيات لضمان الجودة",
      },
      {
        "icon": Icons.precision_manufacturing_rounded,
        "title": "دقة عالية",
        "text": "دقة عالية في التصميم والتركيب",
      },
      {
        "icon": Icons.people_rounded,
        "title": "فريق محترف",
        "text": "نخبة من فنيي تركيبات الأسنان المحترفين",
      },
      {
        "icon": Icons.thumb_up_rounded,
        "title": "رضا العملاء",
        "text": "هدفنا هو رضا العملاء التام من حيث الشكل والجودة",
      },
    ];

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 24.w),
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 20),
                  child: child,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF1A73E8), Color(0xFF00B8D9)],
                        ),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "Why Choose Us?",
                      style: TextStyle(
                        fontFamily: "WorkSans",
                        fontSize: isMobile ? 32.sp : 28.sp,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "لماذا يثق عملاؤنا بنا؟",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: isMobile ? 20.sp : 18.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? Colors.white.withOpacity(0.8)
                          : const Color(0xFF1A1A2E).withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          isMobile
              ? _buildMobileList(items)
              : _buildDesktopScroll(items, isTablet),
        ],
      ),
    );
  }

  Widget _buildMobileList(List<Map<String, dynamic>> items) {
    return Column(
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500 + (index * 100)),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Opacity(
              opacity: value.clamp(0.0, 1.0),
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 20),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: WhyChooseUs(
              isDark: isDark,
              imagePath: "assets/image 12.png",
              description: item["text"] as String,
              icon: item["icon"] as IconData,
              title: item["title"] as String,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDesktopScroll(List<Map<String, dynamic>> items, bool isTablet) {
    return SizedBox(
      height: isTablet ? 380.h : 400.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          final item = items[index];
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 500 + (index * 80)),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: 0.9 + (value * 0.1),
                  child: child,
                ),
              );
            },
            child: WhyChooseUs(
              isDark: isDark,
              imagePath: "assets/image 12.png",
              description: item["text"] as String,
              icon: item["icon"] as IconData,
              title: item["title"] as String,
            ),
          );
        },
      ),
    );
  }
}
