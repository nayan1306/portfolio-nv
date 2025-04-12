import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 79, 79, 79),
            ),
            trackColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 0, 0, 0),
            ),
            trackBorderColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 36, 36, 36),
            ),
            radius: const Radius.circular(10),
            thickness: WidgetStateProperty.all(8),
          ),
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView(
              controller: _scrollController,

              physics: const BouncingScrollPhysics(), // smooth scrolling
              children: const [
                ResponsivePageWidget(
                  title: 'Page 1',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                ResponsivePageWidget(
                  title: 'Page 2',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                ResponsivePageWidget(
                  title: 'Page 3',
                  color: Color.fromARGB(255, 26, 26, 26),
                ),
                ResponsivePageWidget(
                  title: 'Page 4',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                ResponsivePageWidget(
                  title: 'Page 5',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsivePageWidget extends StatelessWidget {
  final String title;
  final Color color;

  const ResponsivePageWidget({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final responsiveHeight = screenHeight * 1.3; // 130% of screen height

    return Container(
      height: responsiveHeight,
      decoration: BoxDecoration(
        color: color,
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
