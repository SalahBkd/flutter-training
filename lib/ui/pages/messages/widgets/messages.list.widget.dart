import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbkd/model/message.model.dart';
import 'package:flutterbkd/ui/pages/messages/widgets/message.item.widget.dart';

class MessagesList extends StatelessWidget {
  List<Message> messages;
  ScrollController scrollController = new ScrollController();

  MessagesList(this.messages);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients)
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          return MessageItemWidget(messages[index]);
        },
        separatorBuilder: (context, index) => Divider(height: 4, color: Colors.blue,),
        itemCount: messages.length);
  }
}
