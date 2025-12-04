import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeSection extends StatefulWidget {
  final bool isDark;

  const ContactMeSection({super.key, required this.isDark});

  @override
  State<ContactMeSection> createState() => _ContactMeSectionState();
}

class _ContactMeSectionState extends State<ContactMeSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
                  colors: widget.isDark
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
                  color: widget.isDark
                      ? Colors.white.withOpacity(0.1)
                      : const Color(0xFF1A73E8).withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: widget.isDark
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
        SizedBox(height: 32.h),
        _buildContactInfo(true),
        SizedBox(height: 32.h),
        _buildForm(true),
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
              SizedBox(height: 32.h),
              _buildContactInfo(false),
            ],
          ),
        ),
        SizedBox(width: isTablet ? 24.w : 32.w),
        Expanded(flex: isTablet ? 1 : 1, child: _buildForm(false)),
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
            Icons.contact_mail_rounded,
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
                "Contact Us",
                style: TextStyle(
                  fontFamily: "WorkSans",
                  fontSize: isMobile ? 32.sp : 28.sp,
                  fontWeight: FontWeight.w800,
                  color: widget.isDark ? Colors.white : const Color(0xFF1A1A2E),
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "تواصل معنا",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: isMobile ? 24.sp : 20.sp,
                  fontWeight: FontWeight.w600,
                  color: widget.isDark
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

  Widget _buildContactInfo(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          Icons.phone_rounded,
          "Phone",
          "الهاتف",
          "01150748170",
          "tel:01150748170",
          isMobile,
        ),
        SizedBox(height: 16.h),
        _buildContactItem(
          FontAwesomeIcons.whatsapp,
          "WhatsApp",
          "واتساب",
          "01150748170",
          "https://wa.me/201150748170",
          isMobile,
        ),
        SizedBox(height: 16.h),
        _buildContactItem(
          Icons.email_rounded,
          "Email",
          "البريد الإلكتروني",
          "mohamed20ali22@gmail.com",
          "mailto:mohamed20ali22@gmail.com",
          isMobile,
        ),
      ],
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String labelEn,
    String labelAr,
    String value,
    String url,
    bool isMobile,
  ) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: widget.isDark
              ? Colors.white.withOpacity(0.05)
              : const Color(0xFF1A73E8).withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: widget.isDark
                ? Colors.white.withOpacity(0.1)
                : const Color(0xFF1A73E8).withOpacity(0.15),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: const Color(0xFF1A73E8).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF1A73E8),
                size: isMobile ? 20.r : 18.r,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labelEn,
                    style: TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: isMobile ? 14.sp : 12.sp,
                      fontWeight: FontWeight.w600,
                      color: widget.isDark ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    value,
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: isMobile ? 15.sp : 14.sp,
                      color: widget.isDark
                          ? Colors.white
                          : const Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Send us a message",
          style: TextStyle(
            fontFamily: "WorkSans",
            fontSize: isMobile ? 20.sp : 18.sp,
            fontWeight: FontWeight.w700,
            color: widget.isDark ? Colors.white : const Color(0xFF1A1A2E),
          ),
        ),
        SizedBox(height: 24.h),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Your Name',
            prefixIcon: const Icon(Icons.person_rounded),
            filled: true,
            fillColor: widget.isDark
                ? Colors.white.withOpacity(0.05)
                : Colors.white.withOpacity(0.7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: widget.isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: widget.isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 2),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Your Email',
            prefixIcon: const Icon(Icons.email_rounded),
            filled: true,
            fillColor: widget.isDark
                ? Colors.white.withOpacity(0.05)
                : Colors.white.withOpacity(0.7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: widget.isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: widget.isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 2),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        TextField(
          controller: _messageController,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: 'Your Message',
            prefixIcon: const Icon(Icons.message_rounded),
            filled: true,
            fillColor: widget.isDark
                ? Colors.white.withOpacity(0.05)
                : Colors.white.withOpacity(0.7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: widget.isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: widget.isDark
                    ? Colors.white.withOpacity(0.1)
                    : const Color(0xFF1A73E8).withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 2),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A73E8),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 8,
              shadowColor: const Color(0xFF1A73E8).withOpacity(0.3),
            ),
            onPressed: () async {
              final name = _nameController.text;
              final email = _emailController.text;
              final message = _messageController.text;

              if (name.isEmpty || email.isEmpty || message.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Please fill all fields"),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              final mailUrl = Uri.parse(
                "mailto:info@queendentallab.com?subject=Contact from Website&body=Name: $name\nEmail: $email\n\n$message",
              );

              if (await launchUrl(mailUrl)) {
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Message sent successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Could not open email app"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(
              "Send Message",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: isMobile ? 16.sp : 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
