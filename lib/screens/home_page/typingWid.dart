import 'dart:async';

import 'package:flutter/material.dart';
class TypingTextAnimation extends StatefulWidget {
  final String text;
  final Duration duration;

  const TypingTextAnimation({Key? key, required this.text, required this.duration}) : super(key: key);

  @override
  _TypingTextAnimationState createState() => _TypingTextAnimationState();
}

class _TypingTextAnimationState extends State<TypingTextAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0, end: widget.text.length.toDouble()).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update the index based on the animation value
          _currentIndex = _animation.value.round();

        });
      });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // Increment the index periodically
      _currentIndex = (_currentIndex + 1) % (widget.text.length + 1);
      if (_currentIndex == 0) {
        // Reset the animation when the text is fully shown
        // _controller.reset();
        _controller.stop();
      }

      else {
        // Start the animation when the index is non-zero
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text.substring(0, _currentIndex), style:TextStyle(color: Colors.white));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Typing Text Animation'),
        ),
        body: Center(
          child: TypingTextAnimation(
            text: 'Hello, this is a Flutter text animation example.',
            duration: Duration(seconds: 3),
          ),
        ),
      ),
    );
  }
}
