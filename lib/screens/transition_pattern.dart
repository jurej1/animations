import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

//The fade transition pattern

//To implement this in Flutter, we will have to make
//use of the FadeScaleTransition and an AnimationController
//to control the entrance and exit of the transition’s child.
//We will make use of our AnimationController status to determine
// whether to show the child widget or hide it.

class HomeScreenFadeTransitionPattern extends StatefulWidget {
  @override
  _HomeScreenFadeTransitionPatternState createState() =>
      _HomeScreenFadeTransitionPatternState();
}

class _HomeScreenFadeTransitionPatternState
    extends State<HomeScreenFadeTransitionPattern>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    )..addStatusListener((status) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool get _isAnimationRunningForwardsOrComplete {
    switch (_controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
        break;

      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('testing FadeScale Transition'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    if (_isAnimationRunningForwardsOrComplete) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                  color: Colors.blue,
                  child: Text(
                    _isAnimationRunningForwardsOrComplete
                        ? 'Hide Box'
                        : 'Show Box',
                  ),
                )
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FadeScaleTransition(animation: _controller, child: child);
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
