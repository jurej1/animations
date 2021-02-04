import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class HomeScreenContainerTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
      floatingActionButton: OpenContainer(
        closedBuilder: (context, openContainer) {
          return FloatingActionButton(
            elevation: 0,
            onPressed: openContainer,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          );
        },
        openColor: Colors.blue,
        closedElevation: 0,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        // openShape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),
        tappable: false,
        closedColor: Colors.blue,
        transitionDuration: Duration(seconds: 1),
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (context, closeContainer) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Details'),
              leading: IconButton(
                onPressed: closeContainer,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    index.toString(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
