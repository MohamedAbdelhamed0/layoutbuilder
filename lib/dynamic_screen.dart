import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layoutbuilder/screens/Screen3.dart';
import 'package:layoutbuilder/screens/screen_one.dart';

import 'cubit_0/Cubit.dart';
import 'helpers/cache_helper.dart';
import 'helpers/responsive_helper.dart';
import 'screens/Screen2.dart';

class DynamicScreen extends StatefulWidget {
  const DynamicScreen({super.key});

  @override
  _DynamicScreenState createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    screen1WidthFraction = await PreferencesHelper.getScreen1Width();
    screen2WidthFraction = await PreferencesHelper.getScreen2Width();
    screen3WidthFraction = await PreferencesHelper.getScreen3Width();
    isScreen2FullScreen = await PreferencesHelper.isScreen2FullScreen();
    setState(() {});
  }

  void _savePreferences() {
    PreferencesHelper.saveScreen1Width(screen1WidthFraction);
    PreferencesHelper.saveScreen2Width(screen2WidthFraction);
    PreferencesHelper.saveScreen3Width(screen3WidthFraction);
    PreferencesHelper.saveScreen2FullScreenState(isScreen2FullScreen);
  }

  double screen1WidthFraction = 0.20;
  double screen2WidthFraction = 0.46;
  double screen3WidthFraction = 0.34;

  double screen1MinWidth = 80.0;
  double screen2MinWidth = 200;
  double screen3MinWidth = 200.0;

  double screen1MaxFraction = 0.20;
  double screen3MaxFraction = 0.34;

  static const double dividerWidthFraction = 0.010;

  bool isHoveringDivider1 = false;
  bool isHoveringDivider2 = false;
  bool isScreen2FullScreen = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    bool isScreen2Visible = !isMobile &&
        (ResponsiveHelper.isTablet(context) ||
            ResponsiveHelper.isMobileLarge(context) ||
            ResponsiveHelper.isTabletLarge(context) ||
            ResponsiveHelper.isSmallDesktop(context) ||
            ResponsiveHelper.isDesktop(context));
    bool isScreen3Visible = !isMobile &&
        (ResponsiveHelper.isSmallDesktop(context) ||
            ResponsiveHelper.isDesktop(context)) &&
        !isScreen2FullScreen;

    return BlocProvider(
      create: (_) => ScreenCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Screen with Draggable Dividers'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double totalScreenWidth = constraints.maxWidth;
            double dividerWidth = totalScreenWidth * dividerWidthFraction;

            double screen1MaxWidth = totalScreenWidth * screen1MaxFraction;
            double screen3MaxWidth = totalScreenWidth * screen3MaxFraction;

            double screen1Width = isMobile
                ? totalScreenWidth
                : totalScreenWidth * screen1WidthFraction;

            double screen3Width = isScreen3Visible
                ? totalScreenWidth * screen3WidthFraction
                : 0.0;

            double screen2Width = isScreen2Visible
                ? totalScreenWidth -
                    screen1Width -
                    screen3Width -
                    (isScreen3Visible ? dividerWidth * 2 : dividerWidth)
                : 0.0;

            return Row(
              children: [
                // Screen 1
                SizedBox(
                  width: screen1Width.clamp(
                      isMobile ? totalScreenWidth : screen1MinWidth,
                      isMobile ? totalScreenWidth : screen1MaxWidth),
                  child: _buildScreen1(screen1Width),
                ),
                // Draggable Divider and Screen 2
                if (isScreen2Visible)
                  SizedBox(
                    width: dividerWidth,
                    child: _buildDraggableDivider(
                      isHovering: isHoveringDivider1,
                      onHoverChange: (isHovering) {
                        setState(() => isHoveringDivider1 = isHovering);
                      },
                      onDrag: (delta) {
                        setState(() {
                          double newScreen1Width = screen1Width + delta;
                          double newScreen1Fraction =
                              newScreen1Width / totalScreenWidth;

                          if (newScreen1Width >= screen1MinWidth &&
                              newScreen1Fraction <= screen1MaxFraction) {
                            screen1WidthFraction = newScreen1Fraction;
                            _savePreferences(); // Save updated screen1 width
                          }
                        });
                      },
                    ),
                  ),
                if (isScreen2Visible)
                  Expanded(
                    child: _buildScreen2(screen2Width, isScreen3Visible),
                  ),
                // Draggable Divider and Screen 3
                if (isScreen3Visible)
                  SizedBox(
                    width: dividerWidth,
                    child: _buildDraggableDivider(
                      isHovering: isHoveringDivider2,
                      onHoverChange: (isHovering) {
                        setState(() => isHoveringDivider2 = isHovering);
                      },
                      onDrag: (delta) {
                        setState(() {
                          double newScreen3Width = screen3Width - delta;
                          double newScreen3Fraction =
                              newScreen3Width / totalScreenWidth;

                          if (newScreen3Width >= screen3MinWidth &&
                              newScreen3Fraction <= screen3MaxFraction) {
                            screen3WidthFraction = newScreen3Fraction;
                            _savePreferences(); // Save updated screen1 width
                          }
                        });
                      },
                    ),
                  ),
                if (isScreen3Visible)
                  SizedBox(
                    width: screen3Width.clamp(screen3MinWidth, screen3MaxWidth),
                    child: _buildScreen3(screen3Width),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDraggableDivider({
    required bool isHovering,
    required ValueChanged<bool> onHoverChange,
    required Function(double) onDrag,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeColumn,
      onEnter: (_) => onHoverChange(true),
      onExit: (_) => onHoverChange(false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: (details) {
          onDrag(details.delta.dx);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isHovering ? Colors.grey.shade600 : Colors.grey.shade300,
            ),
            duration: const Duration(milliseconds: 100),
            child: Center(
              child: Container(
                width: 2,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreen1(double width) {
    return Screen1(width: width);
  }

  Widget _buildScreen2(double width, bool isScreen3Visible) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Screen2(),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: Icon(
                isScreen2FullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
            onPressed: () {
              setState(() {
                isScreen2FullScreen = !isScreen2FullScreen;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildScreen3(double width) {
    return Screen3();
  }
}
