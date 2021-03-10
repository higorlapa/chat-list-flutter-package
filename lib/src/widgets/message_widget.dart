import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Message extends StatefulWidget {
  /// The content to be displayed as a message
  final String content;

  /// the font-family of the [content].
  final String? fontFamily;

  /// the font-size of the [content].
  final double fontSize;

  /// the text-color of the [content].
  final Color? textColor;

  /// Controls who is sending or receiving a message.
  ///
  /// Used to handle in which side of the screen the message
  /// will be displayed.
  final OwnerType ownerType;

  /// Name to be displayed with the initials.
  ///
  /// egg.: Higor Lapa will be HL
  final String? ownerName;

  /// Controls if we should show the owner name inside the avatar
  final bool showOwnerName;

  /// Background color of the message
  final Color? backgroundColor;

  Message(
      {this.content = "",
      this.fontFamily,
      this.fontSize = 16.0,
      this.textColor,
      this.ownerType = OwnerType.sender,
      this.ownerName,
      this.showOwnerName = true,
      this.backgroundColor});

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> implements IMessageWidget {
  String get senderInitials {
    if (!widget.showOwnerName) {
      return "";
    }

    if (widget.ownerName == null || widget.ownerName!.isEmpty) return 'ME';

    try {
      if (widget.ownerName!.lastIndexOf(' ') == -1) {
        return widget.ownerName![0];
      } else {
        var lastInitial =
            widget.ownerName!.substring(widget.ownerName!.lastIndexOf(' ') + 1);

        return widget.ownerName![0] + lastInitial[0];
      }
    } catch (e) {
      print(e);
      return 'ME';
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.ownerType) {
      case OwnerType.receiver:
        return buildReceiver();
      case OwnerType.sender:
      default:
        return buildSender();
    }
  }

  @override
  Widget buildReceiver() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildCircleAvatar(),
        Flexible(
          child: Bubble(
              margin: BubbleEdges.fromLTRB(10, 10, 30, 0),
              stick: true,
              nip: BubbleNip.leftTop,
              color:
                  widget.backgroundColor ?? Color.fromRGBO(233, 232, 252, 10),
              alignment: Alignment.topLeft,
              child: _buildContentText(TextAlign.left)),
        ),
      ],
    );
  }

  @override
  Widget buildSender() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Bubble(
              margin: BubbleEdges.fromLTRB(30, 10, 10, 0),
              stick: true,
              nip: BubbleNip.rightTop,
              color: widget.backgroundColor ?? Colors.white,
              alignment: Alignment.topRight,
              child: _buildContentText(TextAlign.right)),
        ),
        _buildCircleAvatar()
      ],
    );
  }

  Widget _buildContentText(TextAlign align) {
    return Text(
      widget.content,
      textAlign: align,
      style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.textColor ?? Colors.black,
          fontFamily: widget.fontFamily ??
              DefaultTextStyle.of(context).style.fontFamily),
    );
  }

  Widget _buildCircleAvatar() {
    return CircleAvatar(
        radius: 12,
        child: Text(
          senderInitials,
          style: TextStyle(fontSize: 9),
        ));
  }
}

abstract class IMessageWidget {
  Widget buildReceiver();
  Widget buildSender();
}

enum OwnerType { receiver, sender }
