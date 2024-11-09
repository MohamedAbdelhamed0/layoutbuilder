import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit_0/Cubit.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenCubit, ScreenState>(
      builder: (context, state) {
        Widget content;

        switch (state.selectedOption) {
          case ScreenOption.wifi:
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Wi-Fi Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ScreenCubit>()
                        .sendDataToScreen3("Wi-Fi data to Screen3");
                  },
                  child: const Text("Send Wi-Fi Data to Screen3"),
                ),
              ],
            );
            break;

          case ScreenOption.bluetooth:
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bluetooth Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ScreenCubit>()
                        .sendDataToScreen3("Bluetooth data to Screen3");
                  },
                  child: const Text("Send Bluetooth Data to Screen3"),
                ),
              ],
            );
            break;

          case ScreenOption.notifications:
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Notifications Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ScreenCubit>()
                        .sendDataToScreen3("Notifications data to Screen3");
                  },
                  child: const Text("Send Notifications Data to Screen3"),
                ),
              ],
            );
            break;

          case ScreenOption.display:
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Display Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ScreenCubit>()
                        .sendDataToScreen3("Display data to Screen3");
                  },
                  child: const Text("Send Display Data to Screen3"),
                ),
              ],
            );
            break;

          case ScreenOption.security:
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Security Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ScreenCubit>()
                        .sendDataToScreen3("Security data to Screen3");
                  },
                  child: const Text("Send Security Data to Screen3"),
                ),
              ],
            );
            break;

          case ScreenOption.about:
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('About Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ScreenCubit>()
                        .sendDataToScreen3("About data to Screen3");
                  },
                  child: const Text("Send About Data to Screen3"),
                ),
              ],
            );
            break;

          default:
            content = const Center(
                child: Text('Select an option in Screen1',
                    style: TextStyle(fontSize: 18, color: Colors.white)));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.orangeAccent, Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: content,
          ),
        );
      },
    );
  }
}
