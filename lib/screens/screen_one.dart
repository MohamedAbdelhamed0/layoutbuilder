import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit_0/Cubit.dart';

class Screen1 extends StatelessWidget {
  final double width;
  final List<Map<String, dynamic>> settingsItems = [
    {'icon': Icons.wifi, 'title': 'Wi-Fi', 'option': ScreenOption.wifi},
    {
      'icon': Icons.bluetooth,
      'title': 'Bluetooth',
      'option': ScreenOption.bluetooth
    },
    {
      'icon': Icons.notifications,
      'title': 'Notifications',
      'option': ScreenOption.notifications
    },
    {
      'icon': Icons.brightness_6,
      'title': 'Display',
      'option': ScreenOption.display
    },
    {
      'icon': Icons.security,
      'title': 'Security',
      'option': ScreenOption.security
    },
    {'icon': Icons.info, 'title': 'About', 'option': ScreenOption.about},
  ];

  Screen1({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    bool useIconsOnly = width < 100;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: settingsItems.length,
          itemBuilder: (context, index) {
            final item = settingsItems[index];
            return useIconsOnly
                ? IconButton(
                    icon: Icon(item['icon'], color: Colors.white),
                    onPressed: () {
                      context
                          .read<ScreenCubit>()
                          .updateSelectedOption(item['option']);
                    },
                  )
                : ListTile(
                    leading: Icon(item['icon'], color: Colors.white),
                    title: Text(item['title'],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white)),
                    onTap: () {
                      context
                          .read<ScreenCubit>()
                          .updateSelectedOption(item['option']);
                    },
                  );
          },
        ),
      ),
    );
  }
}
