import 'package:flutter/material.dart';

import '../../chat_list.dart';

class ChatList extends StatelessWidget {
  /// Messages that will be shown
  final List<Message> children;

  /// ScrollController to be attached in the [ListView]
  final ScrollController? scrollController;

  /// [ListView] shrinkWrap field
  final bool shrinkWrap;

  /// Padding of the list
  final EdgeInsets padding;

  ChatList(
      {this.children = const <Message>[],
      this.scrollController,
      this.shrinkWrap = true,
      this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 10)});

  Widget build(context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      controller: scrollController ?? ScrollController(),
      padding: padding,
      itemCount: children.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return children[index];
      },
    );
  }
}
