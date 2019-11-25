import 'package:animation_presentation/views/whatsapp_ui_clone/chat_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(WhatsAppClone());

class WhatsAppClone extends StatefulWidget {
  @override
  _WhatsAppCloneState createState() => _WhatsAppCloneState();
}

class _WhatsAppCloneState extends State<WhatsAppClone>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: chats.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsAppClone',
      theme: ThemeData(
        primaryColor: Color(0xff026666),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'CALLS'),
              Tab(text: 'CHATS'),
              Tab(text: 'CONTACTS'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            BuildChatsLayout(),
            BuildChats(),
            BuildContacts(),
          ],
        ),
      ),
    );
  }
}

class BuildChatsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: chats.map(
        (Chat currentChat) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        currentChat.image,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            currentChat.name,
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(currentChat.lastMessage),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(currentChat.time),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: Center(child: Text('1')),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}

class BuildChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        Chat currentChat = chats.elementAt(index);
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(currentChat.name),
              subtitle: Text(currentChat.lastMessage),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(currentChat.image),
              ),
              trailing: Text(currentChat.time),
            ),
            Divider(
              thickness: 1,
            ),
          ],
        );
      },
    );
  }
}

class BuildCalls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Calls'),
    );
  }
}

class BuildContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contacts'),
    );
  }
}
