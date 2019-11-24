import 'package:animation_presentation/views/whatsapp_ui_clone/chat_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(WhatsApp());

class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.white),
          primaryColor: Color(0xff065E52)),
      debugShowCheckedModeBanner: false,
      home: WhatsAppClone(),
    );
  }
}

class WhatsAppClone extends StatefulWidget {
  @override
  _WhatsAppCloneState createState() => _WhatsAppCloneState();
}

class _WhatsAppCloneState extends State<WhatsAppClone>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: chats.length,
      vsync: this,
      initialIndex: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('WhatsApp'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: 'CALLS',
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'CONTACTS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          callScreen(),
          ChatScreen(),
          contactsScreen(),
        ],
      ),
    );
  }

  callScreen() {
    return Center(
      child: Text('calls screen'),
    );
  }

  contactsScreen() {
    return Center(
      child: Text('contacts screen'),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        Chat currentChat = chats.elementAt(index);
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      actions: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more,
                          ),
                        ),
                      ],
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(currentChat.image),
                          ),
                          Column(
                            children: <Widget>[
                              Text(currentChat.name),
                              Text('online'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ListTile(
                title: Text(currentChat.name),
                trailing: Column(
                  children: <Widget>[
                    Text(
                      currentChat.time,
                      style: TextStyle(
                          color:
                              currentChat.isSeen ? Colors.green : Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color:
                              currentChat.isSeen ? Colors.green : Colors.white,
                          shape: BoxShape.circle),
                      child: Center(child: Text('1')),
                    ),
                  ],
                ),
                subtitle: Text(currentChat.lastMessage),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(currentChat.image),
                ),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
