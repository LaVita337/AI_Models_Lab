import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_practice/constants/gaps.dart';
import 'package:tiktok_practice/constants/sizes.dart';
import 'package:tiktok_practice/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_practice/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_practice/features/videos/video_timeline_screen.dart';

class MainNavitationScreen extends StatefulWidget {
  const MainNavitationScreen({super.key});

  @override
  State<MainNavitationScreen> createState() => _MainNavitationScreenState();
}

class _MainNavitationScreenState extends State<MainNavitationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record video"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(top: 10),
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavTab(
                text: "Feed",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.eye,
                selectedIcon: FontAwesomeIcons.solidEye,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(2),
              ),
              Gaps.h24,
              GestureDetector(
                child: PostVideoButton(
                  onTap: _onPostVideoButtonTap,
                ),
              ),
              Gaps.h24,
              NavTab(
                text: "Clip",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.paperclip,
                selectedIcon: FontAwesomeIcons.paperclip,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "My",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.faceSmile,
                selectedIcon: FontAwesomeIcons.faceSmile,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
