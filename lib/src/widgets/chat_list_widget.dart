import 'package:flutter/material.dart';

import '../../chat_list.dart';

class ChatList extends StatelessWidget {
  final List<MessageWidget> children;

  ChatList({this.children = const <MessageWidget>[]});

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: children.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return children[index];
            },
          ),
          flex: 8,
        ),
      ],
    );
  }
}
