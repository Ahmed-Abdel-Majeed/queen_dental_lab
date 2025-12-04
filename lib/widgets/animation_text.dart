import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingTextWidget extends StatefulWidget {
  const TypingTextWidget({super.key});

  @override
  State<TypingTextWidget> createState() => _TypingTextWidgetState();
}

class _TypingTextWidgetState extends State<TypingTextWidget> {
  final String text1 = "I AM";
  final String text2 = "AHMED ABDELMAJED";

  String displayedText1 = "";
  String displayedText2 = "";
  int index1 = 0;
  int index2 = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        if (index1 < text1.length) {
          displayedText1 += text1[index1];
          index1++;
        } else if (index2 < text2.length) {
          displayedText2 += text2[index2];
          index2++;
        } else {
          // Reset to loop again after delay
          _timer?.cancel();
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              displayedText1 = "";
              displayedText2 = "";
              index1 = 0;
              index2 = 0;
            });
            _startTyping();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final screenWidth = MediaQuery.of(context).size.width;

  final bool isMobile = screenWidth < 800;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        displayedText1,
        style: TextStyle(
          fontFamily: "PlaywriteVNGuides",
          fontSize: isMobile ? 43.sp : 19.sp,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      SizedBox(height: 10.h),
      Text(
        displayedText2,
        style: TextStyle(
          fontFamily: "PlaywriteVNGuides",
          fontSize: isMobile ? 45.sp : 20.sp,
          color: Colors.purpleAccent.shade100,
        ),
      ),
    ],
  );
}

}
