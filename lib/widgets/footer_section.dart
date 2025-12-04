import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final bool isDark;

  const FooterSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 1200),
          margin: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 24.w),
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 32.h : 40.h,
            horizontal: isMobile ? 24.w : 32.w,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                  ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
                  : [const Color(0xFFF5F7FB), Colors.white],
            ),
            border: Border(
              top: BorderSide(
                color: isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medical_services_rounded,
                    color: const Color(0xFF1A73E8),
                    size: isMobile ? 32.r : 28.r,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "Queen Dental Lab",
                    style: TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: isMobile ? 24.sp : 22.sp,
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "معمل كوين لتركيبات الأسنان المتحركة",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: isMobile ? 14.sp : 13.sp,
                  color: isDark
                      ? Colors.white.withOpacity(0.7)
                      : const Color(0xFF1A1A2E).withOpacity(0.6),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialIcon(
                    icon: Icons.phone_rounded,
                    url: 'tel:201150748170 ',
                    isDark: isDark,
                    size: isMobile ? 20.r : 18.r,
                  ),
                  SizedBox(width: 16.w),
                  _SocialIcon(
                    icon: FontAwesomeIcons.whatsapp,
                    url: 'https://wa.me/201150748170',
                    isDark: isDark,
                    size: isMobile ? 20.r : 18.r,
                  ),
                  SizedBox(width: 16.w),
                  _SocialIcon(
                    icon: FontAwesomeIcons.instagram,
                    url: 'https://www.facebook.com/share/1JPcpnhnjn/',
                    isDark: isDark,
                    size: isMobile ? 20.r : 18.r,
                  ),
                  SizedBox(width: 16.w),
                  _SocialIcon(
                    icon: FontAwesomeIcons.facebook,
                    url: 'https://www.facebook.com/share/1JPcpnhnjn/',
                    isDark: isDark,
                    size: isMobile ? 20.r : 18.r,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                height: 1,
                width: double.infinity,
                color: isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
              ),
              SizedBox(height: 16.h),
              Text(
                "© ${DateTime.now().year} Queen Dental Lab. All rights reserved.",
                style: TextStyle(
                  fontFamily: "WorkSans",
                  fontSize: isMobile ? 12.sp : 11.sp,
                  color: isDark
                      ? Colors.white.withOpacity(0.5)
                      : const Color(0xFF1A1A2E).withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  final bool isDark;
  final double size;

  const _SocialIcon({
    required this.icon,
    required this.url,
    required this.isDark,
    required this.size,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Could not open ${widget.url}")),
              );
            }
          }
        },
        borderRadius: BorderRadius.circular(12.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: _hovering
                ? const Color(0xFF1A73E8).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            widget.icon,
            color: _hovering
                ? const Color(0xFF1A73E8)
                : (widget.isDark
                      ? Colors.white.withOpacity(0.7)
                      : const Color(0xFF1A1A2E).withOpacity(0.6)),
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
