import 'package:flutter/material.dart';
import 'package:sca_chat_message_app/core/utils/colors.dart';

import '../../../config/route_strings.dart';
import '../../../core/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> chatData = [
    {
      "name": "Alex Linderson",
      "image": AppImages.maxImage,
      "message": "How are you today?",
      "time": "2 min ago",
      "unreadCount": 3,
    },
    {
      "name": "Angel Dayna",
      "image": AppImages.deanImage,
      "message": "Hello! What's up?",
      "time": "5 min ago",
      "unreadCount": 1,
    },
    {
      "name": "John Ahraham",
      "image": AppImages.adilImage,
      "message": "Let's meet at 4 PM.",
      "time": "10 min ago",
      "unreadCount": 0,
    },
    {
      "name": "Sabila Sayma",
      "image": AppImages.adImage,
      "message": "How was the event?",
      "time": "15 min ago",
      "unreadCount": 2,
    },
    {
      "name": "John Borino",
      "image": AppImages.marinaImage,
      "message": "Check this out!",
      "time": "20 min ago",
      "unreadCount": 0,
    },
     {
      "name": "John Borino",
      "image": AppImages.marinaImage,
      "message": "Check this out!",
      "time": "20 min ago",
      "unreadCount": 0,
    },
     {
      "name": "John Borino",
      "image": AppImages.marinaImage,
      "message": "Check this out!",
      "time": "20 min ago",
      "unreadCount": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImages.profileImage), 
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Horizontal list of images and names
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                SizedBox(width: 16),
                ImagesCard(image: AppImages.maxImage, title: 'Max'),
                SizedBox(width: 20),
                ImagesCard(image: AppImages.adilImage, title: 'Adil'),
                SizedBox(width: 20),
                ImagesCard(image: AppImages.adImage, title: 'Marina'),
                SizedBox(width: 20),
                ImagesCard(image: AppImages.deanImage, title: 'Dean'),
                SizedBox(width: 20),
                ImagesCard(image: AppImages.marinaImage, title: 'Alex'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Chat list
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                itemCount: chatData.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.pushNamed(
                        context, AppRouteStrings.chatScreen);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(chat['image']),
                          ),
                          title: Text(
                            chat['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(chat['message']),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(chat['time'], style: const TextStyle(fontSize: 12)),
                              if (chat['unreadCount'] > 0)
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    chat['unreadCount'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.messageIcon, height: 26, width: 26,),
            label: 'Message',
          ),
           BottomNavigationBarItem(
            icon: Image.asset(AppImages.userIcon, height: 26, width: 26,),
            label: 'Customers',
          ),
           BottomNavigationBarItem(
            icon: Image.asset(AppImages.settingsIcon,height: 26, width: 26,),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ImagesCard extends StatelessWidget {
  const ImagesCard({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 50,
          height: 50,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
