import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewLayout extends StatefulWidget {
  @override
  _ListViewLayoutState createState() => _ListViewLayoutState();
}

class _ListViewLayoutState extends State<ListViewLayout> {
  int _crossAxisCount = 2;

  var _type = 'ListTile';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        DefaultTextStyle(
          style: Theme.of(context).textTheme.title,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text("ListView"),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          '''
  ListView(
    children: List.generate(
      100,
      (index) {
        return ListTile(
          title: Text('title \$index'),
          trailing: Text('trailing'),
          subtitle: Text('subtitle'),
          leading: Text('leading'),
          contentPadding: EdgeInsets.all(8),
        )
      },
    ),
  )
                          ''',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MobileDevice(
                child: ListView(
                  children: List.generate(
                    100,
                    (index) {
                      if (_type == 'ListTile') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(fontSize: 20),
                              child: ListTile(
                                title: Text('title $index'),
                                trailing: Text('trailing'),
                                subtitle: Text('subtitle'),
                                leading: Text('leading'),
                                contentPadding: EdgeInsets.all(8),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              height: 2,
                              color: Colors.black,
                            ),
                          ],
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Center(
                                child: Text(index.toString()),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: DropdownButton<String>(
                  value: _type,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      _type = newValue;
                    });
                  },
                  items: ['ListTile', 'Card']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
