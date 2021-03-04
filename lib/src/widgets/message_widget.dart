import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageWidget extends StatefulWidget {
  final String content;
  final String? fontFamily;
  final double? fontSize;
  final Color? textColor;
  final OwnerType? ownerType;
  final String? ownerName;

  MessageWidget(
      {this.content = "",
      this.fontFamily,
      this.fontSize,
      this.textColor,
      this.ownerType,
      this.ownerName});

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget>
    implements IMessageWidget {
  String get senderInitials {
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
              color: Color.fromRGBO(233, 232, 252, 10),
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
              color: Colors.white,
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
          fontSize: widget.fontSize ?? 16.0,
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
