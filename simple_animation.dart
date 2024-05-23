
import 'package:flutter/material.dart';
import 'dart:math';
void main()
{
  runApp(MaterialApp(
    title: "Animation",
    home: AnimatedBallScreen(),
  ));
}

class AnimatedBallScreen extends StatefulWidget {
  // const AnimatedBallScreen({super.key});

  @override
  State<AnimatedBallScreen> createState() => _AnimatedBallScreenState();
}

class _AnimatedBallScreenState extends State<AnimatedBallScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _animation;
  Random random = Random();
  bool _isAnimating = false;
  BoxShape _currentShape = BoxShape.circle;

  @override
  void initState()
  {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
        vsync: this);

    _animation = Tween<Offset>(
      begin: Offset(-1,0),
      end: Offset(0,-1),
    ).animate(_controller);
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation()
  {
    setState(() {
      _isAnimating = ! _isAnimating;
      _currentShape = _getRandomShape();
      if(_isAnimating)
        {
          _controller.repeat(reverse: true);
        }
      else{
        _controller.stop();
      }
    });
  }

  BoxShape _getRandomShape() {
    return random.nextBool() ? BoxShape.circle : BoxShape.rectangle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            width: 100,
            height: 100,

            decoration: BoxDecoration(
              shape: _currentShape,
              color: Color.fromARGB(255,random.nextInt(256),random.nextInt(256),random.nextInt(256)),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAnimation,
        child: Icon(_isAnimating ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}
