import 'package:ai_chat_system/Data/models/chat_model.dart';
import 'package:ai_chat_system/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late TextEditingController textcontroller;
String text = '';

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    textcontroller = TextEditingController();
    textcontroller.clear();
    super.initState();
  }

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void updateTextonScreen() {
      text = textcontroller.text;
      textcontroller.clear();
      setState(() {});
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('AI CHAT SYSTEM'), centerTitle: true),
        body: ListView.builder(
          reverse: true,
          padding: EdgeInsets.only(bottom: height * .01),
          itemCount: chatList.length,

          itemBuilder: (context, index) {
            return UnconstrainedBox(
              alignment:
                  chatList[index].user == 'user'
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
              child: chatsystem(
                height: height,
                width: width,
                message: chatList[index].message,
                user: chatList[index].user,
              ),
            );
          },
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.only(
            bottom: height * .02,
            left: width * 0.02,
            right: width * .02,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: textcontroller,
                  decoration: InputDecoration(
                    hintText: "Ask Our AI model any Question",
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 15,
                      right: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  updateTextonScreen();
                },
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
