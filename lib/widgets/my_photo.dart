import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPhoto extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const MyPhoto({super.key, required this.isDark, required this.onToggleTheme});

@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final bool isMobile = screenWidth < 800;

  return Column(
    children: [
      Image.asset(
        isDark ? "assets/dark.jpg" : "assets/light.jpg",
        height: isMobile ? 400.h : 555.h,
        width: isMobile ? 400.w : 555.w,
        fit: BoxFit.contain,
      ),
      InkWell(
        onTap: onToggleTheme,
        child: Image.asset(
          'assets/light bulb.png',
          width: isMobile ? 150.w : 222.w,
          height: isMobile ? 200.h : 300.h,
          fit: BoxFit.cover,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    ],
  );
}


}
