import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';
// import 'package:flutter/src/scheduler/ticker.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Animation'),
      ),
      body: SafeArea(
        child: MyAnimation(),
      ),
    );
  }
}

class ListData<T> {
  bool isSelected = false;

  final T data;
  ListData(this.data);
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  List<ListData> list = [];

  void populateData() {
    for (int i = 0; i < 10; ++i) {
      list.add(ListData<String>('item $i'));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populateData();
  }

  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    Widget _getListItemTile(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: list[index].isSelected ? Colors.red[100] : Colors.blue,
        child: ListTile(
          title: Text(list[index].data),
        ),
      );
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return _getListItemTile(index);
      },
    );
  }
}
