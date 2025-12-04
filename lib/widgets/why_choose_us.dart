import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhyChooseUs extends StatelessWidget {
  final bool isDark;
  final String imagePath;
  final String description;
  final IconData icon;
  final String title;

  const WhyChooseUs({
    super.key,
    required this.isDark,
    required this.imagePath,
    required this.description,
    this.icon = Icons.star_rounded,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
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
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          width: isMobile ? 320.w : 280.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.4)
                    : const Color(0xFF1A73E8).withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                            const Color(0xFF0F172A).withOpacity(0.9),
                            const Color(0xFF1E293B).withOpacity(0.9),
                          ]
                        : [
                            Colors.white.withOpacity(0.95),
                            const Color(0xFFE3F2FD).withOpacity(0.95),
                          ],
                  ),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withOpacity(0.1)
                        : const Color(0xFF1A73E8).withOpacity(0.15),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: isMobile ? 160.h : 180.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFF1A73E8).withOpacity(0.2),
                            const Color(0xFF00B8D9).withOpacity(0.2),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          size: 64.r,
                          color: const Color(0xFF1A73E8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title.isNotEmpty)
                            Text(
                              title,
                              style: TextStyle(
                                fontFamily: "Cairo",
                                fontSize: isMobile ? 18.sp : 16.sp,
                                fontWeight: FontWeight.w700,
                                color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                              ),
                            ),
                          if (title.isNotEmpty) SizedBox(height: 8.h),
                          Text(
                            description,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: isMobile ? 14.sp : 13.sp,
                              height: 1.6,
                              color: isDark
                                  ? Colors.white.withOpacity(0.85)
                                  : const Color(0xFF1A1A2E).withOpacity(0.75),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
