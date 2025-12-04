import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_dental_lab/screens/about_section.dart';
import 'package:queen_dental_lab/screens/contact_section.dart';
import 'package:queen_dental_lab/screens/projects_section.dart';
import 'package:queen_dental_lab/screens/rating.dart';
import 'package:queen_dental_lab/screens/skills_section.dart';
import 'package:queen_dental_lab/widgets/footer_section.dart';

class PortfolioHomePage extends StatefulWidget {
  final void Function()? onToggleTheme;
  const PortfolioHomePage({super.key, this.onToggleTheme});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  bool get isDark => Theme.of(context).brightness == Brightness.dark;
  final scrollController = ScrollController();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();
  final skillsKey = GlobalKey();
  final homeKey = GlobalKey();
  final ratingKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(isMobile ? 60.h : 72.h),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16.w : 40.w,
                vertical: isMobile ? 8.h : 16.h,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (isDark ? Colors.black : Colors.white).withOpacity(
                        0.7,
                      ),
                      borderRadius: BorderRadius.circular(32.r),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isDark ? 0.45 : 0.15),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 32.r,
                              width: 32.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF1A73E8),
                                    Color(0xFF00B8D9),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF1A73E8,
                                    ).withOpacity(0.35),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.health_and_safety_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Queen Dental Lab",
                              style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: isMobile ? 18.sp : 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (!isMobile) ...[
                          _navItem("HOME", homeKey),
                          _navItem("ABOUT", aboutKey),
                          _navItem("SERVICES", skillsKey),
                          _navItem("GALLERY", projectsKey),
                          _navItem("CONTACT", contactKey),
                          SizedBox(width: 8.w),
                          IconButton(
                            onPressed: widget.onToggleTheme,
                            icon: Icon(
                              isDark
                                  ? Icons.light_mode_rounded
                                  : Icons.dark_mode_rounded,
                              size: 20,
                            ),
                          ),
                        ] else ...[
                          IconButton(
                            onPressed: widget.onToggleTheme,
                            icon: Icon(
                              isDark
                                  ? Icons.light_mode_rounded
                                  : Icons.dark_mode_rounded,
                              size: 20,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              return IconButton(
                                icon: const Icon(Icons.menu_rounded),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) => _buildMobileNavSheet(),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE8F2FF), Color(0xFFF5F7FB)],
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeroSection(isMobile),
                  SizedBox(height: isMobile ? 32.h : 56.h),
                  Container(
                    key: aboutKey,
                    child: AboutSection(isDark: isDark),
                  ),
                  SizedBox(height: isMobile ? 32.h : 56.h),
                  Container(
                    key: skillsKey,
                    child: SkillsSection(isDark: isDark),
                  ),
                  SizedBox(height: isMobile ? 32.h : 56.h),
                  Container(
                    key: ratingKey,
                    child: Rating(isDark: isDark),
                  ),
                  SizedBox(height: isMobile ? 32.h : 56.h),
                  Container(
                    key: projectsKey,
                    child: ProjectsSection(isDark: isDark),
                  ),
                  SizedBox(height: isMobile ? 32.h : 56.h),
                  Container(
                    key: contactKey,
                    child: ContactMeSection(isDark: isDark),
                  ),
                  SizedBox(height: isMobile ? 24.h : 40.h),
                  FooterSection(isDark: isDark),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _navItem(String label, GlobalKey targetKey) {
    return InkWell(
      onTap: () {
        Scrollable.ensureVisible(
          targetKey.currentContext!,
          duration: const Duration(milliseconds: 500),

          // علشان الانيميشن  "ابدأ ببطء، سرّع في النص، واهدى تاني في النهاية"
          curve: Curves.easeInOut,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: "WorkSans",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ).copyWith(letterSpacing: 0.3),
        ),
      ),
    );
  }

  Widget _buildHeroSection(bool isMobile) {
    final theme = Theme.of(context);

    return Container(
      key: homeKey,
      constraints: BoxConstraints(minHeight: isMobile ? 520.h : 580.h),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: isMobile ? 96.h : 120.h,
        left: isMobile ? 20.w : 60.w,
        right: isMobile ? 20.w : 60.w,
        bottom: isMobile ? 40.h : 64.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool narrow = constraints.maxWidth < 900;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -120,
                right: -80,
                child: _blurCircle(
                  diameter: narrow ? 200 : 280,
                  color: const Color(0xFF1A73E8).withOpacity(0.20),
                ),
              ),
              Positioned(
                bottom: -80,
                left: -40,
                child: _blurCircle(
                  diameter: narrow ? 160 : 220,
                  color: const Color(0xFF00B8D9).withOpacity(0.18),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: narrow ? 10 : 6,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 800),
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
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color:
                                  (isDark
                                          ? Colors.white.withOpacity(0.06)
                                          : Colors.white.withOpacity(0.9))
                                      .withOpacity(0.9),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    isDark ? 0.4 : 0.1,
                                  ),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.verified_rounded,
                                  size: 18.sp,
                                  color: const Color(0xFF1A73E8),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Premium removable prosthetics lab",
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.h),
                          Text(
                            "ابتسامة واثقة تبدأ من هنا",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: isMobile ? 34.sp : 36.sp,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "معمل متخصص في التركيبات المتحركة عالية الدقة والجودة، "
                            "لنمنح مرضاك ابتسامة طبيعية ومريحة تدوم طويلاً.",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: isMobile ? 16.sp : 16.sp,
                              height: 1.7,
                              color: isDark
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(
                                    contactKey.currentContext!,
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeInOutCubic,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 18,
                                    ),
                                    SizedBox(width: 8.w),
                                    const Text("طلب تواصل"),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w),
                              TextButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(
                                    projectsKey.currentContext!,
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeInOutCubic,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("استعرض الأعمال"),
                                    SizedBox(width: 6.w),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 18.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32.h),
                          Row(
                            children: [
                              _heroStat("10+", "سنوات خبرة"),
                              SizedBox(width: 22.w),
                              _heroStat("48h", "متوسط زمن التسليم"),
                              SizedBox(width: 22.w),
                              _heroStat("TCS", "مواد معتمدة"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!narrow) SizedBox(width: 32.w),
                  if (!narrow)
                    // الصوره الي في اليمين
                    Expanded(
                      flex: 5,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeOutBack,
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value.clamp(0.0, 1.0),
                            child: Transform.translate(
                              offset: Offset(0, (1 - value) * 30),
                              child: Transform.scale(
                                scale: 0.98 + value * 0.02,
                                child: child,
                              ),
                            ),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 500.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36.r),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: isDark
                                    ? const [
                                        Color(0xFF0F172A),
                                        Color(0xFF111827),
                                      ]
                                    : const [
                                        Color(0xFFFFFFFF),
                                        Color(0xFFE8F2FF),
                                      ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(
                                    isDark ? 0.04 : 0.9,
                                  ),
                                  blurRadius: 30,
                                  offset: const Offset(-18, -18),
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    isDark ? 0.6 : 0.2,
                                  ),
                                  blurRadius: 30,
                                  offset: const Offset(20, 20),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(36.r),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    isDark
                                        ? "assets/rating/Gemini_Generated_Image_zgnp5lzgnp5lzgnp.png"
                                        : "assets/rating/Gemini_Generated_Image_zgnp5lzgnp5lzgnp.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 16,
                                    left: 16,
                                    right: 16,
                                    child: Container(
                                      padding: EdgeInsets.all(12.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                        color: Colors.black.withOpacity(0.35),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.check_circle_rounded,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(width: 8.w),
                                          Expanded(
                                            child: Text(
                                              "تركيبات متحركة بتصميم رقمي لضمان راحة وثبات أعلى.",
                                              style: TextStyle(
                                                fontFamily: "Cairo",
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _heroStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontFamily: "WorkSans",
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 12.sp,
            color: isDark
                ? Colors.white.withOpacity(0.7)
                : Colors.black.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _blurCircle({required double diameter, required Color color}) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          height: diameter,
          width: diameter,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }

  Widget _buildMobileNavSheet() {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF020617).withOpacity(0.96)
            : Colors.white.withOpacity(0.96),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.only(
        top: 16.h,
        left: 24.w,
        right: 24.w,
        bottom: 24.h + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "التنقل",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          _mobileNavItem("الرئيسية", homeKey),
          _mobileNavItem("عن المعمل", aboutKey),
          _mobileNavItem("الخدمات", skillsKey),
          _mobileNavItem("الأعمال", projectsKey),
          _mobileNavItem("التواصل", contactKey),
        ],
      ),
    );
  }

  Widget _mobileNavItem(String label, GlobalKey targetKey) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pop();
        Scrollable.ensureVisible(
          targetKey.currentContext!,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      },
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: TextStyle(fontFamily: "Cairo", fontSize: 16.sp),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
    );
  }
}





// // class HomePage extends StatelessWidget {
//   // const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 2. Accessing Screen dimensions and responsive units.
//     // ScreenUtil is now initialized and ready to use.

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header/Hero Section (Simulating the main content area)
//             Container(
//               // Using a responsive padding based on the screen width
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Left Content Column
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Responsive Text: Title
//                         Text(
//                           'Keep Smiling',
//                           style: TextStyle(
//                             fontSize: 14.sp, // Responsive font size
//                             fontWeight: FontWeight.w600,
//                             color: Colors.blue.shade600,
//                           ),
//                         ),
//                         SizedBox(height: 8.h), // Responsive vertical spacing
//                         Text(
//                           'Your Smile, Our Top Priority!',
//                           style: TextStyle(
//                             fontSize: 34.sp,
//                             fontWeight: FontWeight.w900,
//                             height: 1.2,
//                           ),
//                         ),
//                         SizedBox(height: 16.h),
//                         // Responsive Text: Description
//                         Text(
//                           'Comprehensive Dental Care for All Ages in a Comfortable, Friendly Environment.',
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         SizedBox(height: 30.h),

//                         // Responsive Buttons Row
//                         Row(
//                           children: [
//                             // Primary Button
//                             Container(
//                               // Fixed width relative to design screen width
//                               width: 120.w,
//                               height: 48.h, // Fixed height relative to design screen height
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.shade700,
//                                 borderRadius: BorderRadius.circular(8.r), // Responsive border radius
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Book Now',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 12.w),
//                             // Secondary Button
//                             Container(
//                               width: 150.w,
//                               height: 48.h,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey.shade300),
//                                 borderRadius: BorderRadius.circular(8.r),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Explore Our Services',
//                                   style: TextStyle(
//                                     color: Colors.blue.shade700,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         SizedBox(height: 40.h),

//                         // Statistics Row (Using responsive sizing and spacing)
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             _buildStatColumn('15+', 'Market experience'),
//                             SizedBox(width: 40.w), // Responsive horizontal spacing
//                             _buildStatColumn('24/7', 'Emergency service'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Right Image/Visuals Column (Simplified)
//                   Expanded(
//                     flex: 1,
//                     child: Center(
//                       // Using a responsive square container for the main image area
//                       child: Container(
//                         width: 180.w,
//                         height: 250.h,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(20.r),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Main Image Area',
//                             style: TextStyle(fontSize: 14.sp),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper method to build the responsive stat columns
//   Widget _buildStatColumn(String value, String label) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 36.sp,
//             fontWeight: FontWeight.w800,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(height: 4.h),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Colors.grey.shade500,
//           ),
//         ),
//       ],
//     );
//   }
// }