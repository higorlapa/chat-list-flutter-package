import 'package:chat_list/chat_list.dart';
import 'package:chat_list/models/message_model.dart';
import 'package:chat_list/models/owner_type_enum.dart';
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

  List<MessageModel> _messageList = [ MessageModel("Hi, how are you?", OwnerType.SENDER, ownerName: "Higor Lapa"), MessageModel("Hi, I'm fine and you?!", OwnerType.RECEIVER, ownerName: "Bill Gates")  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ChatList(_messageList))
    );
  }
}
