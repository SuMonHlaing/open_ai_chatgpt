import 'package:flutter/material.dart';
import 'package:open_ai_chatgpt/providers/my_theme_provider.dart';
import 'package:open_ai_chatgpt/screen/ai_chat_screen.dart';
import 'package:open_ai_chatgpt/screen/person_screen.dart';
import 'package:open_ai_chatgpt/screen/post_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<MyThemeProvider>(context);
    final color = themeStatus.themeType ? Colors.white : Colors.black;

    final List<Widget> tab = [
      const AIChatScreen(),
      const PostScreen(),
      const PersonScreen(),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('ChatGPT',
              style: TextStyle(
                color: color,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  if (themeStatus.themeType) {
                    themeStatus.setTheme = false;
                  } else {
                    themeStatus.setTheme = true;
                  }
                },
                icon: Icon(
                  themeStatus.themeType
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                  color: color,
                ))
          ],
        ),
        body: tab[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: color,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'AI Chat'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.post_add), label: 'Posts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              print(selectedIndex);
            }));
  }
}
