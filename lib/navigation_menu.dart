import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/features/branch/screens/addscreen/addscreen.dart';
import 'package:stigma/features/branch/screens/chat/chat.dart';
import 'package:stigma/features/branch/screens/history/history.dart';
import 'package:stigma/features/branch/screens/home/home.dart';
import 'package:stigma/features/branch/screens/menu/menu.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          darkMode
              ? const Color(0xFF1E1E1E) // Dark Mode background
              : const Color.fromARGB(
                255,
                255,
                255,
                255,
              ), // Light Mode background

      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddScreen(context),
        backgroundColor:
            darkMode ? const Color(0xffA52A2A) : const Color(0xff554FBB),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: const CircularNotchedRectangle(), // Enables notch
          notchMargin: 12, // Adjust notch space
          color:
              darkMode
                  ? const Color(0xFF2C2C2C)
                  : const Color(0xff554FBB), // Bar color
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
            ), // Horizontal padding
            child: SizedBox(
              height: 70, // Height of BottomAppBar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side icons
                  Row(
                    children: [
                      _buildNavIcon(
                        icon: Icons.home,
                        label: 'Home',
                        index: 0,
                        controller: controller,
                        darkMode: darkMode,
                      ),
                      const SizedBox(width: 35), // Space between icons
                      _buildNavIcon(
                        icon: Icons.history_rounded,
                        label: 'History',
                        index: 1,
                        controller: controller,
                        darkMode: darkMode,
                      ),
                    ],
                  ),
                  // Right side icons
                  Row(
                    children: [
                      _buildNavIcon(
                        icon: Icons.chat_rounded,
                        label: 'Chat',
                        index: 2,
                        controller: controller,
                        darkMode: darkMode,
                      ),
                      const SizedBox(width: 35), // Space between icons
                      _buildNavIcon(
                        icon: Icons.grid_view,
                        label: 'Menu',
                        index: 3,
                        controller: controller,
                        darkMode: darkMode,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  /// Reusable Icon Builder for Navigation
  Widget _buildNavIcon({
    required IconData icon,
    required String label,
    required int index,
    required NavigationController controller,
    required bool darkMode,
  }) {
    final isSelected = controller.selectedIndex.value == index;

    Color selectedColor =
        darkMode ? Colors.white : const Color.fromARGB(255, 255, 255, 255);
    Color unselectedColor =
        darkMode
            ? const Color.fromARGB(255, 0, 0, 0)
            : const Color.fromARGB(255, 0, 0, 0);

    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? selectedColor : unselectedColor,
            size: 28,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? selectedColor : unselectedColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToAddScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddScreen()));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  /// Screens for Navigation
  final screens = [HomeScreen1(), HistoryScreen(), ChatScreen(), MenuScreen()];
}

/// Placeholder Screens
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Center(child: Text('Home'));
// }

// class HistoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Center(child: Text('History'));
// }

// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Center(child: Text('Chat'));
// }

// class MenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Center(child: Text('Menu'));
// }
