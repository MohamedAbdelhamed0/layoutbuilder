import 'package:flutter/material.dart';

class ResponsiveHelper extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget? tabletLarge;
  final Widget? smallDesktop;
  final Widget desktop;

  const ResponsiveHelper({
    super.key,
    required this.mobile,
    this.mobileLarge,
    this.tablet,
    this.tabletLarge,
    this.smallDesktop,
    required this.desktop,
  });

  // Device Width Breakpoints
  static const double _mobileMaxWidth = 600;
  static const double _mobileLargeMaxWidth = 750;
  static const double _tabletMaxWidth = 850;
  static const double _smallDesktopMaxWidth = 1000;
  static const double _desktopMinWidth = 1250;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= _desktopMinWidth) {
      return desktop;
    } else if (screenWidth >= _smallDesktopMaxWidth && smallDesktop != null) {
      return smallDesktop!;
    } else if (screenWidth >= _tabletMaxWidth && tabletLarge != null) {
      return tabletLarge!;
    } else if (screenWidth >= _mobileLargeMaxWidth && tablet != null) {
      return tablet!;
    } else if (screenWidth >= _mobileMaxWidth && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }

  // Screen Size Checkers
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= _mobileMaxWidth;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width > _mobileMaxWidth &&
      MediaQuery.of(context).size.width <= _mobileLargeMaxWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > _mobileLargeMaxWidth &&
      MediaQuery.of(context).size.width <= _tabletMaxWidth;

  static bool isTabletLarge(BuildContext context) =>
      MediaQuery.of(context).size.width > _tabletMaxWidth &&
      MediaQuery.of(context).size.width < _smallDesktopMaxWidth;

  static bool isSmallDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _smallDesktopMaxWidth &&
      MediaQuery.of(context).size.width < _desktopMinWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _desktopMinWidth;

  /// Get a responsive value based on screen width.
  static T getResponsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? mobileLarge,
    T? tablet,
    T? tabletLarge,
    T? smallDesktop,
    required T desktop,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= _desktopMinWidth) return desktop;
    if (screenWidth >= _smallDesktopMaxWidth && smallDesktop != null) {
      return smallDesktop;
    }
    if (screenWidth >= _tabletMaxWidth && tabletLarge != null) {
      return tabletLarge;
    }
    if (screenWidth >= _mobileLargeMaxWidth && tablet != null) return tablet;
    if (screenWidth >= _mobileMaxWidth && mobileLarge != null) {
      return mobileLarge;
    }
    return mobile;
  }

  /// Get a responsive width factor (between 0 and 1) for flexible widgets.
  static double getWidthFactor({
    required BuildContext context,
    double desktop = 1.0,
    double smallDesktop = 1.0,
    double tabletLarge = 1.0,
    double tablet = 1.0,
    double mobileLarge = 1.0,
    double mobile = 1.0,
  }) {
    return getResponsiveValue<double>(
      context: context,
      mobile: mobile,
      mobileLarge: mobileLarge,
      tablet: tablet,
      tabletLarge: tabletLarge,
      smallDesktop: smallDesktop,
      desktop: desktop,
    );
  }

  /// Get a responsive height factor (between 0 and 1) for flexible widgets.
  static double getHeightFactor({
    required BuildContext context,
    double desktop = 1.0,
    double smallDesktop = 1.0,
    double tabletLarge = 1.0,
    double tablet = 1.0,
    double mobileLarge = 1.0,
    double mobile = 1.0,
  }) {
    return getResponsiveValue<double>(
      context: context,
      mobile: mobile,
      mobileLarge: mobileLarge,
      tablet: tablet,
      tabletLarge: tabletLarge,
      smallDesktop: smallDesktop,
      desktop: desktop,
    );
  }

  /// Get a responsive aspect ratio factor (between 0 and 1) for flexible widgets.
  static double getAspectRatioFactor({
    required BuildContext context,
    double desktop = 1.0,
    double smallDesktop = 1.0,
    double tabletLarge = 1.0,
    double tablet = 1.0,
    double mobileLarge = 1.0,
    double mobile = 1.0,
  }) {
    return getResponsiveValue<double>(
      context: context,
      mobile: mobile,
      mobileLarge: mobileLarge,
      tablet: tablet,
      tabletLarge: tabletLarge,
      smallDesktop: smallDesktop,
      desktop: desktop,
    );
  }

  /// Conditionally render a widget based on whether the screen width is greater than [widthThreshold].
  static Widget? showIfWidthGreaterThan({
    required BuildContext context,
    required double widthThreshold,
    required Widget child,
    Widget? fallback,
  }) {
    return MediaQuery.of(context).size.width >= widthThreshold
        ? child
        : fallback;
  }

  /// Renders the `mobileTabletWidget` for mobile/tablet screens and `desktopWidget` for desktop.
  static Widget flexibleWidget({
    required BuildContext context,
    required Widget mobileTabletWidget,
    required Widget desktopWidget,
  }) {
    return (isMobile(context) || isMobileLarge(context) || isTablet(context))
        ? mobileTabletWidget
        : desktopWidget;
  }
}
