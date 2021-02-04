import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

//The fade through transition pattern
//The implementation of the fade through transition
//pattern is very similar to that of the shared axis
//transition pattern. Here, FadeThroughTransition is
//used instead of SharedAxisTransition.

class HomeScreenFadeThroughTransition extends StatefulWidget {
  @override
  _HomeScreenFadeThroughTransitionState createState() =>
      _HomeScreenFadeThroughTransitionState();
}

class _HomeScreenFadeThroughTransitionState
    extends State<HomeScreenFadeThroughTransition> {
  int _pageIndex = 0;
  List<Widget> _pageList = [
    Container(key: UniqueKey(), color: Colors.red),
    Container(key: UniqueKey(), color: Colors.blue),
    Container(key: UniqueKey(), color: Colors.green)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Fade Thru'),
      ),
      body: PageTransitionSwitcher(
        duration: Duration(seconds: 1),
        transitionBuilder: (
          child,
          primaryAnimation,
          secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pageList[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.looks_one,
            ),
            label: 'One',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.looks_two,
            ),
            label: 'Two',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.looks_3,
            ),
            label: 'Three',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (newPage) {
          setState(() {
            _pageIndex = newPage;
          });
        },
      ),
    );
  }
}
