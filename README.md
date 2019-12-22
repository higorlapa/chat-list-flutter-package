# chat_list

A flutter package to incorporate a chat view in a simple way
and jump start your chat application.

[![Pub](https://img.shields.io/pub/v/chat_list)](https://pub.dev/packages/chat_list)
[![GitHub stars](https://img.shields.io/github/stars/lapadev/chat-list-flutter-package?style=social)](https://github.com/lapadev/chat-list-flutter-package)

## Example

See [source](https://github.com/lapadev/chat-list-flutter-package/tree/master/example)

## Usage

```dart

//Create a list with messages
  List<MessageModel> _messageList = [
    MessageModel("Hi, how are you?", OwnerType.SENDER, ownerName: "Higor Lapa"),
    MessageModel("Hi, I'm fine and you?!", OwnerType.RECEIVER,
        ownerName: "Bill Gates")
  ];

//Place the widget inside your build function
ChatList(
  messageList: _messageList,
),

```

<img src="https://github.com/lapadev/chat-list-flutter-package/tree/master/example/screenshots/example.png?raw=true" width="360">

