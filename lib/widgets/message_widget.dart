import 'package:bubble/bubble.dart';
import 'package:chat_list/models/message_model.dart';
import 'package:chat_list/models/owner_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class MessageWidget extends StatelessWidget {


  final MessageModel _messageModel;


  MessageWidget(this._messageModel);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: _messageModel.ownerType == OwnerType.RECEIVER
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: <Widget>[
        _messageModel.ownerType == OwnerType.RECEIVER
            ? CircleAvatar(
        radius: 12,
        child: Text(
          _messageModel.senderInitials(),
          style: TextStyle(fontSize: 9),
        ))
            : Text(''),
        Flexible(
          child: Bubble(
            margin: BubbleEdges.fromLTRB( _messageModel.ownerType == OwnerType.RECEIVER  ? 10 : 30, 10,
                _messageModel.ownerType == OwnerType.RECEIVER ? 30 : 10, 0),
            stick: true,
            nip:  _messageModel.ownerType == OwnerType.RECEIVER
                ? BubbleNip.leftTop
                : BubbleNip.rightTop,
            color:  _messageModel.ownerType == OwnerType.RECEIVER
                ? Color.fromRGBO(233, 232, 252, 10)
                : Colors.white,
            alignment:  _messageModel.ownerType == OwnerType.RECEIVER
                ? Alignment.topLeft
                : Alignment.topRight,
            child: Text(
              _messageModel.content,
              textAlign:
              _messageModel.ownerType == OwnerType.RECEIVER ? TextAlign.left : TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        _messageModel.ownerType == OwnerType.RECEIVER
            ? Text('')
            : CircleAvatar(
            radius: 12,
            child: Text(
              _messageModel.senderInitials(),
              style: TextStyle(fontSize: 9),
            )),
      ],
    );
  }



}
