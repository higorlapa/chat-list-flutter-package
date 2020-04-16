import 'package:chat_list/chat_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatList Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ChatList Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MessageWidget> _messageList = [
    MessageWidget(
        content: "Hi, Bill! This is the simplest example ever.",
        ownerType: OwnerType.sender,
        ownerName: "Higor Lapa"),
    MessageWidget(
        content:
            "Let's make it better , Higor. Custom font size and text color",
        textColor: Colors.black38,
        fontSize: 18.0,
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    MessageWidget(
        content: "Bill, we have to talk about business",
        fontSize: 12.0,
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    MessageWidget(
        content: "Wow, I like it. Tell me what I can do for you, pal.",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    MessageWidget(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    MessageWidget(
        content: "Nice",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    MessageWidget(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    MessageWidget(
        content: "Nice",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    MessageWidget(
        content: "I'm just a copy",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    MessageWidget(
        content: "Nice",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    MessageWidget(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    MessageWidget(
        content: "Nice", ownerType: OwnerType.sender, ownerName: "Higor"),
    MessageWidget(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(child: ChatList(children: _messageList)));
  }
}
