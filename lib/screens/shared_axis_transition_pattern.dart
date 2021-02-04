import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

//PageTransitionSwitcher and SharedAxisTransition

//The PAGETRANSITIONSWITCHER widget simply
//transitions from an old child to a new child when its child changes.
//You should always give each child of the PageTransitionSwitcher
//a unique key so that Flutter knows the widget now has a new child.
//This can easily be done with a UniqueKey object.

//In our case, we will return a SharedAxisTransition widget.
//In the SharedAxisTransition widget, we can set the transitionType
//(whether we want to transition along the x-axis, y-axis, or z-axis).
//We also have the animation and secondaryAnimation parameters, which
//define the animation that drives the child’s entrance and exit
//and the animation that drives the transition of a new child on
//top of the old one, respectively.

class HomeScreenSharedAxis extends StatefulWidget {
  @override
  _HomeScreenSharedAxisState createState() => _HomeScreenSharedAxisState();
}

class _HomeScreenSharedAxisState extends State<HomeScreenSharedAxis> {
  bool _onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: _onFirstPage == true
                        ? null
                        : () {
                            setState(() {
                              _onFirstPage = true;
                              print(_onFirstPage);
                            });
                          },
                    child: Text(
                      'First Page',
                      style: TextStyle(
                        color: _onFirstPage == true
                            ? Colors.blue.withOpacity(0.5)
                            : Colors.blue,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: _onFirstPage == false
                        ? null
                        : () {
                            setState(() {
                              _onFirstPage = false;
                              print(_onFirstPage);
                            });
                          },
                    child: Text(
                      'Second Page',
                      style: TextStyle(
                        color: _onFirstPage == false
                            ? Colors.red.withOpacity(0.5)
                            : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageTransitionSwitcher(
                duration: Duration(milliseconds: 500),
                reverse: _onFirstPage,
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return SharedAxisTransition(
                    child: child,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType
                        .scaled, // defininf around which axis i want a transition to be displayed
                  );
                },
                child: _onFirstPage
                    ? Container(
                        key: UniqueKey(),
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: Text('FIRST PAGE'),
                      )
                    : Container(
                        key: UniqueKey(),
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: Text('SECOND PAGE'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
