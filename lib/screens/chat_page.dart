import 'package:anything_ai/apis/chatgptApi.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../helpers/colors.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({super.key, required this.title});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController question = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            letterSpacing: 3,
            fontSize: 25,
            color: ligh_blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Expanded(
              child: TextFormField(
            controller: question,
            textAlign: TextAlign.center,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                isDense: true,
                hintText: 'Ask me anything you want...',
                hintStyle: const TextStyle(fontSize: 14),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
          )),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              if (question.text.toString().isEmpty) {
                Fluttertoast.showToast(msg: "Enter the Message!");
              } else {
                ChatgptApi.getChatAnswer(question.toString());
              }
            },
            child: const CircleAvatar(
              radius: 24,
              backgroundColor: ligh_blue,
              child: Icon(Icons.rocket_launch_rounded,
                  color: Colors.white, size: 28),
            ),
          )
        ]),
      ),
      // body: ListView(
      //   physics: const BouncingScrollPhysics(),
      //   // controller: question.scrollC,
      //   padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
      //   children: _c.list.map((e) => MessageCard(message: e)).toList(),
      // ),
    );
  }
}
