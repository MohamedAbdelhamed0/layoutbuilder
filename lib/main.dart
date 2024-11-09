import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dynamic_screen.dart';
import 'helpers/responsive_helper.dart'; // Ensure this is the correct import for ResponsiveHelper

Future<void> main() async {
  // Ensure Flutter is initialized before using async methods in main
  WidgetsFlutterBinding.ensureInitialized();

  // Optionally, pre-load SharedPreferences
  await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsive UI',
      home: DynamicScreen(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive UI with ResponsiveHelper'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: ResponsiveHelper.getResponsiveValue(
            context: context,
            mobile: 100.0,
            mobileLarge: 150.0,
            tablet: 200.0,
            tabletLarge: 250.0,
            smallDesktop: 300.0,
            desktop: 350.0,
          ),
          height: ResponsiveHelper.getResponsiveValue(
            context: context,
            mobile: 100.0,
            mobileLarge: 150.0,
            tablet: 200.0,
            tabletLarge: 250.0,
            smallDesktop: 300.0,
            desktop: 350.0,
          ),
          padding: ResponsiveHelper.getResponsiveValue<EdgeInsets>(
            context: context,
            mobile: const EdgeInsets.all(8),
            mobileLarge: const EdgeInsets.all(12),
            tablet: const EdgeInsets.all(16),
            tabletLarge: const EdgeInsets.all(20),
            smallDesktop: const EdgeInsets.all(24),
            desktop: const EdgeInsets.all(28),
          ),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 500),
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: ResponsiveHelper.getResponsiveValue(
                  context: context,
                  mobile: 20.0,
                  mobileLarge: 22.0,
                  tablet: 24.0,
                  tabletLarge: 26.0,
                  smallDesktop: 28.0,
                  desktop: 30.0,
                ),
              ),
              child: ResponsiveHelper.getResponsiveValue<Widget>(
                context: context,
                mobile: const Text('Small'),
                mobileLarge: const Text('Mobile Large'),
                tablet: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tablet'),
                    SizedBox(height: 10),
                    Text('More Info'),
                  ],
                ),
                tabletLarge: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tablet Large'),
                    SizedBox(height: 10),
                    Text('Additional Info'),
                  ],
                ),
                smallDesktop: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Small Desktop'),
                    SizedBox(height: 10),
                    Text('Extra Info'),
                  ],
                ),
                desktop: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Desktop'),
                    SizedBox(height: 10),
                    Text('Full Details Here'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
