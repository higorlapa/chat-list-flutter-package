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
  ];

//Place the widget inside your build function
ChatList(
  children: _messageList,
),

```

<img src="https://github.com/lapadev/chat-list-flutter-package/blob/master/example/screenshots/example.png?raw=true" width="360">

