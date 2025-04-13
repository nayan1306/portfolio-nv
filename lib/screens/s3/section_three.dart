import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionThree extends StatefulWidget {
  const SectionThree({super.key});

  @override
  State<SectionThree> createState() => _SectionThreeState();
}

class _SectionThreeState extends State<SectionThree>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _scrollProgress = ValueNotifier<double>(0.0);
  late AnimationController _fadeInController;
  bool _showScrollIndicator = true;
  // ignore: unused_field
  double _sliderValue = 0.0;
  // Flag to avoid feedback loops between scroll and slider
  bool _isUserScrolling = false;

  final List<TimelineEvent> _events = const [
    TimelineEvent(
      "ISRO SAC",
      'R&D Intern',
      "Developing an advanced software system for satellite-based crop monitoring, leveraging cutting-edge technology to provide real-time insights and optimize agricultural productivity.",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Indian_Space_Research_Organisation_Logo.svg/2119px-Indian_Space_Research_Organisation_Logo.svg.png",
      "July 2024 - Feb 2025",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _fadeInController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _scrollController.addListener(_updateScrollProgress);

    // Hide scroll indicator after delay
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) setState(() => _showScrollIndicator = false);
    });
  }

  void _updateScrollProgress() {
    if (_scrollController.positions.isNotEmpty && !_isUserScrolling) {
      final double maxScroll = _scrollController.position.maxScrollExtent;
      final double currentScroll = _scrollController.offset;
      final double newProgress =
          maxScroll > 0 ? currentScroll / maxScroll : 0.0;

      _scrollProgress.value = newProgress;

      // Update slider value without triggering setState to avoid rebuild during scroll
      _sliderValue = newProgress;
    }
  }

  // Method to handle slider changes and update scroll position in real-time
  void _handleSliderChange(double value) {
    // Set flag to prevent feedback loop
    _isUserScrolling = true;

    setState(() {
      _sliderValue = value;
    });

    if (_scrollController.positions.isNotEmpty) {
      final double maxScroll = _scrollController.position.maxScrollExtent;
      final double targetPosition = value * maxScroll;

      // Use jumpTo for immediate response instead of animateTo
      _scrollController.jumpTo(targetPosition);
      _scrollProgress.value = value;
    }

    // Clear flag after a short delay to allow scroll events to settle
    Future.delayed(const Duration(milliseconds: 100), () {
      _isUserScrolling = false;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose();
    _fadeInController.dispose();
    _scrollProgress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final double horizontalPadding =
        isMobile ? screenWidth * 0.05 : screenWidth * 0.11;

    return Container(
      height: isMobile ? screenHeight * 2.0 : screenHeight * 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 32, 32, 32),
            const Color.fromARGB(255, 16, 16, 16),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.08),

            // Section Header with animation
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _fadeInController,
                curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
              ),
              child: Text(
                "EXPERIENCE",
                style: GoogleFonts.robotoCondensed(
                  textStyle: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 60 : 90,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Description text with animation
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _fadeInController,
                curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
              ),
              child: SizedBox(
                width: isMobile ? screenWidth * 0.9 : screenWidth * 0.5,
                child: Text(
                  "Years of evolving from a curious coder to a creator of dynamic, immersive experiences combining innovation, expertise, and passion every step of the way.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                    fontSize: isMobile ? 16 : 20,
                    letterSpacing: 1.2,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            // Timeline section
            Expanded(
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: _fadeInController,
                  curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
                ),
                child: Column(
                  children: [
                    // Timeline progress bar with slider
                    _buildTimelineSlider(isMobile, screenWidth),

                    // Scroll indicator
                    if (_showScrollIndicator) _buildScrollIndicator(),

                    // Main timeline content with standard horizontal scroll
                    Expanded(
                      child: _buildTimelineScrollView(isMobile, screenWidth),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineSlider(bool isMobile, double screenWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Stack(
        children: [
          // Base line
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 4,
              color: const Color.fromARGB(255, 62, 62, 62).withOpacity(0.3),
            ),
          ),

          // Progress indicator
          ValueListenableBuilder<double>(
            valueListenable: _scrollProgress,
            builder: (context, progress, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, const Color(0xFFFFD700)],
                      ),
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Timeline dots
          ..._events.asMap().entries.map((entry) {
            final index = entry.key;
            return ValueListenableBuilder<double>(
              valueListenable: _scrollProgress,
              builder: (context, progress, _) {
                final position = index / (_events.length - 1);
                final isActive = progress >= position - 0.05;

                return Positioned(
                  left: position * screenWidth * (isMobile ? 0.9 : 0.78),
                  top: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color:
                          isActive
                              ? const Color(0xFFFFD700)
                              : const Color.fromARGB(
                                255,
                                29,
                                29,
                                29,
                              ).withOpacity(0.5),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: isActive ? 2 : 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              isActive
                                  ? const Color(0xFFFFD700).withOpacity(0.5)
                                  : Colors.blue.withOpacity(0.3),
                          blurRadius: isActive ? 8 : 4,
                          spreadRadius: isActive ? 2 : 0,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),

          // Custom draggable slider for better realtime performance
          GestureDetector(
            onHorizontalDragStart: (details) {
              _isUserScrolling = true;
            },
            onHorizontalDragUpdate: (details) {
              final RenderBox box = context.findRenderObject() as RenderBox;
              final double localDx = details.localPosition.dx;
              final double sliderWidth = box.size.width;

              // Calculate slider value based on drag position
              double newValue = (localDx / sliderWidth).clamp(0.0, 1.0);

              // Update slider value and scroll position
              _handleSliderChange(newValue);
            },
            onHorizontalDragEnd: (details) {
              // Reset flag after drag ends
              Future.delayed(const Duration(milliseconds: 100), () {
                _isUserScrolling = false;
              });
            },
            child: Container(
              width: double.infinity,
              height: 30,
              color: Colors.transparent,
              child: Stack(
                children: [
                  // // Custom slider thumb
                  // Positioned(
                  //   left: _sliderValue * screenWidth * (isMobile ? 0.9 : 0.78),
                  //   top: -4,
                  //   child: Container(
                  //     width: 24,
                  //     height: 24,
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFFFD700),
                  //       shape: BoxShape.circle,
                  //       border: Border.all(color: Colors.white, width: 2),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: const Color(0xFFFFD700).withOpacity(0.5),
                  //           blurRadius: 8,
                  //           spreadRadius: 2,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollIndicator() {
    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _fadeInController,
          curve: const Interval(0.9, 1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.keyboard_arrow_left, color: Colors.white70, size: 24),
            const SizedBox(width: 8),
            Text(
              "Scroll or drag slider to explore",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_right, color: Colors.white70, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineScrollView(bool isMobile, double screenWidth) {
    // Use standard horizontal ScrollView with physics optimized for smooth scrolling
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // Only update _isUserScrolling flag when user is scrolling directly
        if (notification is ScrollStartNotification) {
          _isUserScrolling = false; // Allow scroll updates to be processed
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(), // Changed for smoother feel
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              _events.asMap().entries.map((entry) {
                final index = entry.key;
                return TimelineTile(
                  event: entry.value,
                  isFirst: index == 0,
                  isLast: index == _events.length - 1,
                  index: index,
                  isMobile: isMobile,
                  screenWidth: screenWidth,
                );
              }).toList(),
        ),
      ),
    );
  }
}

class TimelineEvent {
  final String title;
  final String subtitle;
  final String description;
  final String icon;
  final String year;

  const TimelineEvent(
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.year,
  );
}

class TimelineTile extends StatefulWidget {
  final TimelineEvent event;
  final bool isFirst;
  final bool isLast;
  final int index;
  final bool isMobile;
  final double screenWidth;

  const TimelineTile({
    super.key,
    required this.event,
    required this.isFirst,
    required this.isLast,
    required this.index,
    required this.isMobile,
    required this.screenWidth,
  });

  @override
  State<TimelineTile> createState() => _TimelineTileState();
}

class _TimelineTileState extends State<TimelineTile>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    // Staggered animation start
    Future.delayed(Duration(milliseconds: 300 + (widget.index * 120)), () {
      if (mounted) _animController.forward();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth =
        widget.isMobile ? widget.screenWidth * 0.8 : widget.screenWidth * 0.25;

    return FadeTransition(
      opacity: _opacityAnimation,
      child: Container(
        width: cardWidth,
        height: 380,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
    return Column(
      children: [
        // Year marker
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text(
                widget.event.year,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 188, 188, 188),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 140,
                height: 2,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 255, 47),
                      Color(0xFFFFD700),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),

        // Main card
        Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color:
                    _isHovered
                        ? Colors.white.withOpacity(0.12)
                        : Colors.white.withOpacity(0.07),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      _isHovered
                          ? const Color.fromARGB(
                            255,
                            255,
                            192,
                            76,
                          ).withOpacity(0.7)
                          : const Color.fromARGB(
                            255,
                            125,
                            125,
                            125,
                          ).withOpacity(0.3),
                  width: _isHovered ? 2.0 : 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        _isHovered
                            ? const Color.fromARGB(
                              255,
                              37,
                              37,
                              37,
                            ).withOpacity(0.3)
                            : Colors.black.withOpacity(0.2),
                    blurRadius: _isHovered ? 15 : 10,
                    spreadRadius: _isHovered ? 1 : 0,
                    offset: Offset(0, _isHovered ? 2 : 4),
                  ),
                ],
              ),
              transform:
                  _isHovered
                      ? (Matrix4.identity()..translate(0.0, -8.0))
                      : Matrix4.identity(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon container
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color:
                          _isHovered
                              ? const Color.fromARGB(147, 0, 0, 0)
                              : const Color.fromARGB(
                                255,
                                36,
                                36,
                                36,
                              ).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Image.network(
                      widget.event.icon,
                      // color:
                      //     _isHovered
                      //         ? const Color(0xFFFFD700)
                      //         : Colors.white.withOpacity(0.85),
                      width: 35,
                    ),
                  ),

                  // Content
                  Text(
                    widget.event.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:
                          _isHovered
                              ? const Color.fromARGB(255, 255, 211, 122)
                              : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.event.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),

                  const Spacer(),

                  // Action button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isHovered
                              ? const Color.fromARGB(
                                255,
                                22,
                                22,
                                22,
                              ).withOpacity(0.7)
                              : const Color.fromARGB(
                                255,
                                28,
                                28,
                                29,
                              ).withOpacity(0.2),
                      foregroundColor:
                          _isHovered
                              ? const Color.fromARGB(255, 230, 203, 53)
                              : Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "View Details",
                          style: TextStyle(
                            fontWeight:
                                _isHovered
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                        if (_isHovered) ...[
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 16),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
