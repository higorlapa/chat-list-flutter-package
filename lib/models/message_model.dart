import 'owner_type_enum.dart';

class MessageModel {

  int id;
  String content;
  dynamic timestamp;
  OwnerType ownerType;
  String ownerName;

  MessageModel(this.content, this.ownerType, {this.id, this.ownerName, this.timestamp});

  String senderInitials ()  {

    if(this.ownerName == null) return 'ME';

    return _getUserInitials(this.ownerName);

  }

  String _getUserInitials(String name) {

    if(name.lastIndexOf(' ') == -1) {

      return name[0];

    } else  {

      String lastInitial = name.substring(name.lastIndexOf(' ') + 1);

      return name[0] + lastInitial[0];

    }

  }


}
