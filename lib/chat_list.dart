library chat_list;

import 'package:chat_list/models/message_model.dart';
export 'package:chat_list/models/message_model.dart';
import 'package:chat_list/widgets/message_widget.dart';
export  'package:chat_list/widgets/message_widget.dart';
import 'package:flutter/widgets.dart';


class ChatList extends StatelessWidget {


  final List<MessageModel> messageList;

  ChatList({this.messageList});

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child:
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: messageList.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return MessageWidget(
                  MessageModel(
                      messageList[index].content,
                      messageList[index].ownerType,
                      ownerName: messageList[index].ownerName)
              );
            },
          ),
          flex: 8,
        ),
      ],
    );
  }


}