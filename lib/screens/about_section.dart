import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;

  const AboutSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;
    final bool isTablet = screenWidth >= 800 && screenWidth < 1200;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 24.w),
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Transform.translate(
              offset: Offset(0, (1 - value) * 24),
              child: child,
            ),
          );
        },
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
                          const Color(0xFF0F172A).withOpacity(0.85),
                          const Color(0xFF1E293B).withOpacity(0.85),
                        ]
                      : [
                          Colors.white.withOpacity(0.9),
                          const Color(0xFFE3F2FD).withOpacity(0.9),
                        ],
                ),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : const Color(0xFF1A73E8).withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.4)
                        : const Color(0xFF1A73E8).withOpacity(0.15),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              padding: EdgeInsets.all(isMobile ? 24.w : 32.w),
              child: isMobile
                  ? _buildMobileLayout()
                  : _buildDesktopLayout(isTablet),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(true),
        SizedBox(height: 24.h),
        _buildContent(true),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isTablet ? 1 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(false),
              SizedBox(height: 24.h),
              _buildContent(false),
            ],
          ),
        ),
        SizedBox(width: isTablet ? 24.w : 32.w),
        Expanded(
          flex: isTablet ? 1 : 1,
          child: Container(
            height: 300.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1A73E8).withOpacity(0.1),
                  const Color(0xFF00B8D9).withOpacity(0.1),
                ],
              ),
            ),
            child: Center(
              child: Icon(
                Icons.medical_services_rounded,
                size: 120.r,
                color: const Color(0xFF1A73E8).withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1A73E8), Color(0xFF00B8D9)],
            ),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1A73E8).withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            Icons.medical_services_rounded,
            color: Colors.white,
            size: isMobile ? 24.r : 20.r,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Us",
                style: TextStyle(
                  fontFamily: "WorkSans",
                  fontSize: isMobile ? 32.sp : 28.sp,
                  fontWeight: FontWeight.w800,
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "عن المعمل",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: isMobile ? 24.sp : 20.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? Colors.white.withOpacity(0.8)
                      : const Color(0xFF1A1A2E).withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(bool isMobile) {
    return Text(
      '''نحن معمل متخصص في تركيب وصناعة الأسنان المتحركة بمختلف أنواعها، نعمل على تقديم حلول تعويضية مبتكرة تساعد على استعادة الابتسامة والثقة لكل عملائنا.

بخبرة تمتد لأكثر من 10 سنوات في مجال التركيبات السنية، نفخر بتقديم خدمات دقيقة وعالية الجودة باستخدام أحدث التقنيات والمواد المعتمدة عالميًا.

يضم فريقنا نخبة من فنيي تركيبات الأسنان المحترفين الذين يحرصون على تحقيق أعلى درجات الراحة والجمال والوظيفة في كل عمل نقوم به.

هدفنا هو أن يشعر كل عميل بالرضا التام من حيث الشكل الطبيعي والمتانة وسهولة الاستخدام.''',
      style: TextStyle(
        fontFamily: "Cairo",
        fontSize: isMobile ? 16.sp : 15.sp,
        height: 1.8,
        color: isDark
            ? Colors.white.withOpacity(0.9)
            : const Color(0xFF1A1A2E).withOpacity(0.8),
      ),
    );
  }
}
