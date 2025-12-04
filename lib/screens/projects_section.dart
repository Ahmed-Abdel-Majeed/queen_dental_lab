import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class ProjectsSection extends StatefulWidget {
  final bool isDark;

  const ProjectsSection({super.key, required this.isDark});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<String> _imagePaths = const [
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.06_f7cacdc1.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.47_8b96b9d5.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.47_9236aa65.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.48_123378ac.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.51_8748d6d5.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.52_c2d4cbbd.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.53_c0c7a116.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.06_b0b598bd.jpg',
    'assets/our_business/WhatsApp Image 2025-12-04 at 16.45.06_bbf091bd.jpg',
  ];

  final List<String> _videoPaths = const [
    'assets/our_business/1.mp4',
    'assets/our_business/2.mp4',
    'assets/our_business/3.mp4',
  ];

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(isMobile),
          SizedBox(height: 40.h),
          _buildGalleryGrid(isMobile, isTablet),
          SizedBox(height: 48.h),
          _buildVideosSection(isMobile, isTablet),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(bool isMobile) {
    return TweenAnimationBuilder<double>(
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
                "Our Work",
                style: TextStyle(
                  fontFamily: "WorkSans",
                  fontSize: isMobile ? 36.sp : 32.sp,
                  fontWeight: FontWeight.w800,
                  color: widget.isDark ? Colors.white : const Color(0xFF1A1A2E),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "أعمالنا",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: isMobile ? 28.sp : 24.sp,
                fontWeight: FontWeight.w700,
                color: widget.isDark
                    ? Colors.white.withOpacity(0.9)
                    : const Color(0xFF1A1A2E).withOpacity(0.85),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "مختارات من حالات التركيبات المتحركة التي تم تنفيذها في المعمل.",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: isMobile ? 15.sp : 14.sp,
                height: 1.7,
                color: widget.isDark
                    ? Colors.white.withOpacity(0.7)
                    : const Color(0xFF1A1A2E).withOpacity(0.65),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryGrid(bool isMobile, bool isTablet) {
    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
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
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _imagePaths.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 20.w,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 600 + (index * 50)),
            curve: Curves.easeOutCubic,
            builder: (context, animValue, child) {
              return Opacity(
                opacity: animValue.clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: 0.9 + (animValue * 0.1),
                  child: child,
                ),
              );
            },
            child: _GalleryCard(
              imagePath: _imagePaths[index],
              isDark: widget.isDark,
              onTap: () => _openImageViewer(_imagePaths[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVideosSection(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4.w,
              height: 24.h,
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
              "Videos from Our Lab",
              style: TextStyle(
                fontFamily: "WorkSans",
                fontSize: isMobile ? 28.sp : 24.sp,
                fontWeight: FontWeight.w700,
                color: widget.isDark ? Colors.white : const Color(0xFF1A1A2E),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            "فيديوهات من داخل المعمل",
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: isMobile ? 20.sp : 18.sp,
              fontWeight: FontWeight.w600,
              color: widget.isDark
                  ? Colors.white.withOpacity(0.8)
                  : const Color(0xFF1A1A2E).withOpacity(0.7),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 850),
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
          child: isMobile
              ? Column(
                  children: _videoPaths
                      .asMap()
                      .entries
                      .map(
                        (entry) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: _VideoCard(
                            videoPath: entry.value,
                            index: entry.key,
                            isDark: widget.isDark,
                            onTap: () => _openVideoPlayer(entry.value),
                          ),
                        ),
                      )
                      .toList(),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 2 : 3,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 1.6,
                  ),
                  itemCount: _videoPaths.length,
                  itemBuilder: (context, index) {
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 650 + (index * 50)),
                      curve: Curves.easeOutCubic,
                      builder: (context, animValue, child) {
                        return Opacity(
                          opacity: animValue.clamp(0.0, 1.0),
                          child: Transform.scale(
                            scale: 0.9 + (animValue * 0.1),
                            child: child,
                          ),
                        );
                      },
                      child: _VideoCard(
                        videoPath: _videoPaths[index],
                        index: index,
                        isDark: widget.isDark,
                        onTap: () => _openVideoPlayer(_videoPaths[index]),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _openImageViewer(String imagePath) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'image_viewer',
      barrierColor: Colors.black.withOpacity(0.92),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Hero(
                tag: imagePath,
                child: InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 4.0,
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.88, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
    );
  }

  void _openVideoPlayer(String path) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.75),
      builder: (context) {
        return _VideoPlayerSheet(videoPath: path, isDark: widget.isDark);
      },
    );
  }
}

class _GalleryCard extends StatefulWidget {
  final String imagePath;
  final bool isDark;
  final VoidCallback onTap;

  const _GalleryCard({
    required this.imagePath,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<_GalleryCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_hovering ? 1.02 : 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: widget.isDark
                        ? Colors.black.withOpacity(0.6)
                        : const Color(0xFF1A73E8).withOpacity(0.15),
                    blurRadius: _hovering ? 24 : 16,
                    offset: Offset(0, _hovering ? 12 : 8),
                    spreadRadius: _hovering ? 2 : 0,
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.imagePath,
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(_hovering ? 0.3 : 0.15),
                        ],
                      ),
                    ),
                  ),
                  if (_hovering)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A73E8).withOpacity(0.1),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.zoom_in_rounded,
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VideoCard extends StatefulWidget {
  final String videoPath;
  final int index;
  final bool isDark;
  final VoidCallback onTap;

  const _VideoCard({
    required this.videoPath,
    required this.index,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<_VideoCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_hovering ? 1.03 : 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              width: isMobile ? double.infinity : 260.w,
              height: isMobile ? 200.h : 240.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.isDark
                      ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
                      : [Colors.white, const Color(0xFFE3F2FD)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.isDark
                        ? Colors.black.withOpacity(0.6)
                        : const Color(0xFF1A73E8).withOpacity(0.2),
                    blurRadius: _hovering ? 24 : 16,
                    offset: Offset(0, _hovering ? 12 : 8),
                    spreadRadius: _hovering ? 2 : 0,
                  ),
                ],
                border: Border.all(
                  color: widget.isDark
                      ? Colors.white.withOpacity(0.1)
                      : const Color(0xFF1A73E8).withOpacity(0.15),
                  width: 1,
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 72.r,
                      width: 72.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1A73E8), Color(0xFF00B8D9)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1A73E8).withOpacity(0.4),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                    child: Text(
                      "Video ${widget.index + 1}",
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VideoPlayerSheet extends StatefulWidget {
  final String videoPath;
  final bool isDark;

  const _VideoPlayerSheet({required this.videoPath, required this.isDark});

  @override
  State<_VideoPlayerSheet> createState() => _VideoPlayerSheetState();
}

class _VideoPlayerSheetState extends State<_VideoPlayerSheet> {
  VideoPlayerController? _controller;
  bool _initialized = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    if (kIsWeb) {
      // For web, use network URL or asset URL
      final videoUrl = '/${widget.videoPath}';
      _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
        ..initialize()
            .then((_) {
              if (mounted) {
                setState(() {
                  _initialized = true;
                });
              }
            })
            .catchError((error) {
              debugPrint('Error initializing web video: $error');
              // Fallback to asset for web
              _controller = VideoPlayerController.asset(widget.videoPath)
                ..initialize().then((_) {
                  if (mounted) {
                    setState(() {
                      _initialized = true;
                    });
                  }
                });
            });
    } else {
      _controller = VideoPlayerController.asset(widget.videoPath)
        ..initialize()
            .then((_) {
              if (mounted) {
                setState(() {
                  _initialized = true;
                });
              }
            })
            .catchError((error) {
              debugPrint('Error initializing video: $error');
            });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height * 0.7;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      padding: EdgeInsets.only(
        top: 20.h,
        left: 20.w,
        right: 20.w,
        bottom: 20.h + mediaQuery.padding.bottom,
      ),
      decoration: BoxDecoration(
        color: widget.isDark ? const Color(0xFF0F172A) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 32,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Lab Video",
                style: TextStyle(
                  fontFamily: "WorkSans",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: widget.isDark ? Colors.white : const Color(0xFF1A1A2E),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: widget.isDark ? Colors.white70 : Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(child: _buildVideoPlayer()),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (!_initialized || _controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller!),
                  GestureDetector(
                    onTap: _togglePlay,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: AnimatedOpacity(
                          opacity: _isPlaying ? 0 : 1,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            height: 72.r,
                            width: 72.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            IconButton(
              onPressed: _togglePlay,
              icon: Icon(
                _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: widget.isDark ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: VideoProgressIndicator(
                _controller!,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: const Color(0xFF1A73E8),
                  bufferedColor: const Color(0xFF1A73E8).withOpacity(0.3),
                  backgroundColor: widget.isDark
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black.withOpacity(0.2),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _togglePlay() {
    if (_controller == null) return;
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
        _isPlaying = false;
      } else {
        _controller!.play();
        _isPlaying = true;
      }
    });
  }
}
