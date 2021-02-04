import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

class StaggeredAnimationMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text('Animation'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StaggeredAnimation(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StaggeredAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimationLimiter(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 250),
              child: FadeInAnimation(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
