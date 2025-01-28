import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sca_chat_message_app/core/utils/colors.dart';
import 'package:sca_chat_message_app/core/utils/images.dart';



class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppImages.adilImage), 
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jhon Abraham", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Active now", style: TextStyle(fontSize: 12, color: AppColors.green)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Center(child: Text("Today", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                MessageBubble(text: "Hello! Jhon abraham", isMe: true, sender: "Me", image: AppImages.adilImage, time: "09:25 AM"),
                MessageBubble(text: "Hello! Nazrul How are you?", isMe: false, sender: "Jhon Abraham", image: AppImages.adilImage, time: "09:25 AM"),
                MessageBubble(text: "You did your job well!", isMe: true, sender: "Me", image: AppImages.adilImage, time: "09:25 AM"),
                MessageBubble(text: "Have a great working week!", isMe: false, sender: "Jhon Abraham", image: AppImages.adilImage, time: "09:26 AM"),
                MessageBubble(text: "Hope you like it", isMe: false, sender: "Jhon Abraham", image: AppImages.adilImage, time: "09:26 AM"),
                MessageBubble(text: "Thanks.", isMe: true, sender: "Me", image: AppImages.adilImage, time: "09:25 AM"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.textIcon),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write your message",
                      fillColor: AppColors.lightGrey,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    suffix: SvgPicture.asset(AppIcons.attachIcon)
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String sender;
  final String image;
  final String time;

  const MessageBubble({super.key, required this.text, required this.isMe, required this.sender, required this.image, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe)
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 15,
          ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(sender, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? AppColors.green : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: isMe ? Colors.white : Colors.black),
                  ),
                 
                ],
              ),
            ),
            Text(
                    time,
                    style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                  ),
          ],
        ),
        if (isMe)
          SizedBox(width: 8),
      ],
    );
  }
}