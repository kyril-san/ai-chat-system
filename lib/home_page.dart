import 'package:ai_chat_system/Data/apis/chat_api.dart';
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
List<ChatModel> chatList = [];
bool isLoading = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    chatList.clear();
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

    Future<ChatModel> sendRequestToModel({required String message}) async {
      var respwithoutPromptEngineering = await ChatApi().sendchatmessage(
        message: message,
      );

      return respwithoutPromptEngineering;
    }

    Future<void> updateTextonScreen() async {
      setState(() {
        isLoading = true;
      });

      final text = textcontroller.text.trim();
      if (text.isEmpty) return;

      // Add user's message
      chatList.insert(0, ChatModel(id: '0', user: 'user', message: text));
      setState(() {});

      try {
        // Call without prompt engineering
        final response1 = await sendRequestToModel(message: text);
        chatList.insert(0, response1);
      } finally {
        setState(() {
          textcontroller.clear();
          isLoading = false;
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('AI CHAT SYSTEM'), centerTitle: true),
        body:
            chatList.isNotEmpty
                ? ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(bottom: height * .1),
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
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/openai.png',
                        width: width * 0.5,
                      ),
                    ),
                    SizedBox(height: height * .02),
                    Text(
                      "Hi, How can I help you today",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
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
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
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

              !isLoading
                  ? IconButton(
                    onPressed: () async {
                      updateTextonScreen();
                      // await ChatApi().getid();
                    },
                    icon: Icon(Icons.send),
                  )
                  : CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
