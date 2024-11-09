import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  final double width;

  // List of settings for the screen
  final List<Map<String, dynamic>> settingsItems = [
    {'icon': Icons.wifi, 'title': 'Wi-Fi'},
    {'icon': Icons.bluetooth, 'title': 'Bluetooth'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
    {'icon': Icons.brightness_6, 'title': 'Display'},
    {'icon': Icons.security, 'title': 'Security'},
    {'icon': Icons.info, 'title': 'About'},
  ];

  Screen1({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    bool useIconsOnly = width < 100;
    if (kDebugMode) {
      print('Screen1: width: $width, useIconsOnly: $useIconsOnly');
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          backgroundBlendMode: BlendMode.difference,
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.rectangle,
          color: Colors.blueAccent,
        ),
        child: ListView.builder(
          itemCount: settingsItems.length,
          itemBuilder: (context, index) {
            final item = settingsItems[index];
            return useIconsOnly
                ? IconButton(
                    icon: Icon(item['icon'], color: Colors.white),
                    onPressed: () {},
                  )
                : ListTile(
                    leading: Icon(item['icon'], color: Colors.white),
                    title: Text(
                      overflow: TextOverflow.ellipsis,
                      item['title'],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  );
          },
        ),
      ),
    );
  }
}
